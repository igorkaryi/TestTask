//
//  NewsViewModel.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import Foundation
import Moya
import Moya_ObjectMapper
import RxSwift

enum NewsType: String {
    case event
    case shop
}

class NewsViewModel: NewsProtocols {
    private let service = MoyaProvider<Service>()
    public var newsArray = Variable<[News]>([])
    public var filteredNewsArray = Variable<[News]>([])
    public var errorString = Variable<String>("")

    public func getNews() {
        service.request(.news) { [weak self] result in
            switch result {
            case let .success(response):
                guard let data = try? response.mapArray(News.self) else { return }
                self?.newsArray.value = data
                self?.filteredNewsArray.value = self?.newsArray.value.filter { $0.type == NewsType.event.rawValue } ?? []
            case let .failure(error):
                self?.errorString.value = error.errorDescription ?? "unknown error"
            }
        }
    }

    public func getFilteredNews(type: NewsType) {
        filteredNewsArray.value = newsArray.value.filter { $0.type == type.rawValue }
    }

    public func numberOfRows() -> Int {
        return filteredNewsArray.value.count
    }

    public func cellViewModel(forIndexPath IndexPath: IndexPath) -> NewsCellProtocol? {
        let news = filteredNewsArray.value[IndexPath.row]
        return NewsCellViewModel(news: news)
    }

    func detailViewModel(forIndexPath IndexPath: IndexPath) -> DetailNewsProtocol? {
        let news = filteredNewsArray.value[IndexPath.row]
        return DetailNewsViewModel(detailNews: news)
    }
}

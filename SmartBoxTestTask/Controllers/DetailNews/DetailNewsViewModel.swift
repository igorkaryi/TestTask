//
//  DetailNewsVM.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import Foundation
import RxSwift

class DetailNewsViewModel: DetailNewsProtocol {
    var detailNews: News

    init(detailNews: News) {
        self.detailNews = detailNews
    }

    var bigImage: String {
        return detailNews.bigImage ?? ""
    }

    var title: String {
        return detailNews.title ?? ""
    }

    var shortDescription: String {
        return detailNews.shortDescription ?? ""
    }

    var description: String {
        return detailNews.description ?? ""
    }

    func showOnMap() -> MapProtocol? {
        return MapViewModel(news: detailNews)
    }
}

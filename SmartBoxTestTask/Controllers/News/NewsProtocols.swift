//
//  NewsP.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import Foundation
import RxSwift

protocol NewsProtocols: class {
    var newsArray: Variable<[News]> { get }
    var filteredNewsArray: Variable<[News]> { get }
    var errorString: Variable<String> { get }
    func getNews()
    func getFilteredNews(type: NewsType)
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath IndexPath: IndexPath) -> NewsCellProtocol?
    func detailViewModel(forIndexPath IndexPath: IndexPath) -> DetailNewsProtocol?
}

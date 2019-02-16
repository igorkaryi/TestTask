//
//  MapViewModel.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import Foundation
import RxSwift

class MapViewModel: MapProtocol {
    var news: News

    init(news: News) {
        self.news = news
    }

    var title: String {
        return news.title ?? ""
    }

    var latitude: String {
        return news.latitude ?? ""
    }

    var longitude: String {
        return news.longitude ?? ""
    }
}

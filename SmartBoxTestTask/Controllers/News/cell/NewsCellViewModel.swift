//
//  NewsCellViewModel.swift
//  SmartBoxTestTask
//
//  Created by Igor Karyi on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import Foundation

class NewsCellViewModel: NewsCellProtocol {
    private var news: News

    init(news: News) {
        self.news = news
    }

    var icon: String {
        return news.smallImage ?? ""
    }

    var title: String {
        return news.title ?? ""
    }

    var shortDescription: String {
        return news.shortDescription ?? ""
    }
}

//
//  News.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import ObjectMapper

struct News {
    var id: Int?
    var type: String?
    var title: String?
    var shortDescription: String?
    var description: String?
    var smallImage: String?
    var bigImage: String?
    var latitude: String?
    var longitude: String?
}

extension News: Mappable {
    init?(map _: Map) {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        type <- map["type"]
        title <- map["title"]
        shortDescription <- map["shortDescription"]
        description <- map["description"]
        smallImage <- map["smallImage"]
        bigImage <- map["bigImage"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}

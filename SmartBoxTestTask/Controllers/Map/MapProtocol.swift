//
//  MapProtocol.swift
//  SmartBoxTestTask
//
//  Created by Igor Karyi on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import Foundation

protocol MapProtocol: class {
    var news: News { get }
    var title: String { get }
    var latitude: String { get }
    var longitude: String { get }
}

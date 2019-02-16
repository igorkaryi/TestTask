//
//  DetailNewsP.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import Foundation
import RxSwift

protocol DetailNewsProtocol: class {
    var detailNews: News { get }
    var bigImage: String { get }
    var title: String { get }
    var shortDescription: String { get }
    var description: String { get }
    func showOnMap() -> MapProtocol?
}

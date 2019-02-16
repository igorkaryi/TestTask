//
//  NewsCellProtocols.swift
//  SmartBoxTestTask
//
//  Created by Igor Karyi on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import Foundation

protocol NewsCellProtocol: class {
    var icon: String { get }
    var title: String { get }
    var shortDescription: String { get }
}

//
//  Service.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import Moya

enum Service {
    case news
}

extension Service: TargetType {
    var baseURL: URL { return URL(string: "http://smartbox.software/tt")! }

    var path: String {
        switch self {
        case .news:
            return "/TT.json"
        }
    }

    var method: Moya.Method {
        switch self {
        case .news:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .news:
            return .requestPlain
        }
    }

    var sampleData: Data {
        return Data()
    }

    var headers: [String: String]? {
        return nil
    }

    var parameters: [String: Any]? {
        return nil
    }

    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
}

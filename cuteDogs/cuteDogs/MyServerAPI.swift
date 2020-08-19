//
//  MyServerAPI.swift
//  cuteDogs
//
//  Created by Larissa Diniz on 19/08/20.
//  Copyright © 2020 Larissa Diniz. All rights reserved.
//

import Foundation
import Moya

enum MyServerAPI {

    case random
    case breed(name: String)
    
}

extension MyServerAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://dog.ceo/api")!
    }
    
    var path: String {
        switch self {
        case .random:
            return "/breeds/image/random"
        case .breed(let name):
            return "/breed/\(name)/images"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}

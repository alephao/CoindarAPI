//  Copyright © 2018 Aleph Retamal. All rights reserved.

import Moya

enum CoindarTarget {
    case coins
    case tags
    case events(EventsParams)
    case social(coins: [String])
}

extension CoindarTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://coindar.org/api/v2/")!
    }
    
    var path: String {
        switch self {
        case .coins: return "/coins"
        case .tags: return "/tags"
        case .events: return "/events"
        case .social: return "/social"
        }
    }
    
    var method: Moya.Method { return .get }
    
    var task: Moya.Task {
        switch self {
        case .coins: return .requestPlain
        case .tags: return .requestPlain
        case .events(let params): return .requestCustomJSONEncodable(params, encoder: JSONEncoder.snake)
        case .social(let coins): return .requestParameters(parameters: ["coins": coins], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? { return nil }
    
    var sampleData: Data {
        switch self {
        case .coins: return Data()
        case .tags: return Data()
        case .events: return Data()
        case .social: return Data()
        }
    }
}

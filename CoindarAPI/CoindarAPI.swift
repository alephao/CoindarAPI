//  Copyright © 2018 Lalacode. All rights reserved.

import Moya
import Result
import Common

public typealias Cancellable = Moya.Cancellable

public class CoindarAPI {
    
    private var provider: MoyaProvider<CoindarTarget>
    
    public init(token: String) {
        let authPlugin = AuthPlugin(token: token)
        provider = MoyaProvider<CoindarTarget>(plugins: [authPlugin])
    }
    
    public func getEvents(params: EventsParams,
                          onSuccess: @escaping ([Event]) -> Void,
                          onError: @escaping (Error) -> Void) -> Cancellable {
        return provider.request(.events(params)) { result in
            switch result {
            case .success(let response):
                do {
                    let events = try response.map([Event].self, atKeyPath: nil, using: JSONDecoder.snake, failsOnEmptyData: true)
                    onSuccess(events)
                } catch {
                    onError(error)
                }
            case .failure(let error):
                switch error {
                case .underlying(_, let resp):
                    if let statusCode = resp?.statusCode,
                        let err = NetworkingError.from(statusCode: statusCode) {
                        onError(err)
                        return
                    }
                default: break
                }
                onError(error)
            }
        }
    }
    
    public func getCoins(progress: @escaping (Double) -> Void,
                         onSuccess: @escaping ([Coin]) -> Void,
                         onError: @escaping (Error) -> Void) -> Cancellable {
        return provider.request(.coins, progress: { progress($0.progress) }) { result in
            switch result {
            case .success(let response):
                do {
                    let events = try response.map([Coin].self, atKeyPath: nil, using: JSONDecoder.snake, failsOnEmptyData: true)
                    onSuccess(events)
                } catch {
                    onError(error)
                }
            case .failure(let error):
                switch error {
                case .underlying(_, let resp):
                    if let statusCode = resp?.statusCode,
                        let err = NetworkingError.from(statusCode: statusCode) {
                        onError(err)
                        return
                    }
                default: break
                }
                onError(error)
            }
        }
    }
    
    public func getTags(progress: @escaping (Double) -> Void,
                        onSuccess: @escaping ([Tag]) -> Void,
                        onError: @escaping (Error) -> Void) -> Cancellable {
        return provider.request(.tags, progress: { progress($0.progress) }) { result in
            switch result {
            case .success(let response):
                do {
                    let events = try response.map([Tag].self, atKeyPath: nil, using: JSONDecoder.snake, failsOnEmptyData: true)
                    onSuccess(events)
                } catch {
                    onError(error)
                }
            case .failure(let error):
                switch error {
                case .underlying(_, let resp):
                    if let statusCode = resp?.statusCode,
                        let err = NetworkingError.from(statusCode: statusCode) {
                        onError(err)
                        return
                    }
                default: break
                }
                onError(error)
            }
        }
    }
    
}

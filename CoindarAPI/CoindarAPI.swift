//  Copyright © 2018 Lalacode. All rights reserved.

import Moya
import Result

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
                onError(error)
            }
        }
    }
    
}

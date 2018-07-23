//  Copyright © 2018 Lalacode. All rights reserved.

import Moya
import Result

public class CoindarAPI {
    
    private var provider: MoyaProvider<CoindarTarget>
    
    public init(token: String) {
        let authPlugin = AuthPlugin(token: token)
        provider = MoyaProvider<CoindarTarget>(plugins: [authPlugin])
    }
    
//    public func getCoins() {
//        
//    }
//    public func coins(completion: (Result<[Coin], ) -> Void) -> Cancellable {
//        provider.request(.coins) { result in
//            switch result {
//            case .success(let obj): break
//            case .failure(let err): break
//            }
//        }
//    }
    
    
}

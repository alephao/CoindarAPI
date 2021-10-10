//  Copyright © 2018 Aleph Retamal. All rights reserved.

import Foundation

class TestHelper {
    class func bundle() -> Bundle {
        .module
    }
    
    class func url(_ name: String, withExtension: String) -> URL {
        bundle().url(forResource: name, withExtension: withExtension)!
    }
    
    class func data(_ name: String, withExtension: String) -> Data {
        let url = TestHelper.url(name, withExtension: withExtension)
        return try! Data(contentsOf: url)
    }
}

//  Copyright © 2018 Aleph Retamal. All rights reserved.

import XCTest
@testable import CoindarAPI

class JSONEncoderExtensionsTests: XCTestCase {
    
    struct MyType: Encodable {
        let someRandomAttribute: String
    }
    
    func testEncode() {
        // Arrange
        let encoder = JSONEncoder.snake
        let myType = MyType(someRandomAttribute: "hello")
        
        // Act
        let encoded = try? encoder.encode(myType)
        
        // Assert
        let encodedString = encoded.map({ String(data: $0, encoding: .utf8) })
        XCTAssertEqual(encodedString, "{\"some_random_attribute\":\"hello\"}")
    }
    
}

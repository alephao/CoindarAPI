//  Copyright © 2018 Aleph Retamal. All rights reserved.

import XCTest
@testable import CoindarAPI

class JSONDecoderExtensionsTests: XCTestCase {
    
    struct MyType: Decodable {
        let someRandomAttribute: String
    }
    
    func testDecode() {
        // Arrange
        let data = "{\"some_random_attribute\": \"hello\"}".data(using: .utf8)!
        let decoder = JSONDecoder.snake
        
        // Act
        let decoded = try? decoder.decode(MyType.self, from: data)
        
        // Assert
        XCTAssertEqual(decoded?.someRandomAttribute, "hello")
    }
    
}

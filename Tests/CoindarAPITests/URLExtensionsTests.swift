//  Copyright © 2018 Aleph Retamal. All rights reserved.

import XCTest
@testable import CoindarAPI

class URLExtensionsTests: XCTestCase {
    
    func testAddingQueryItemOnUrlWithNoQueryItems() {
        // Arrange
        let url = URL(string: "https://mywebsite.com/")!
        let queryItem = URLQueryItem(name: "key", value: "value")
        
        // Act
        let subject = url.withQueryItem(queryItem)
        
        // Assert
        XCTAssertEqual(subject?.query, "key=value")
    }
    
    func testAddingQueryItemOnUrlWithQueryItems() {
        // Arrange
        let url = URL(string: "https://mywebsite.com/?a=b&c=d")!
        let queryItem = URLQueryItem(name: "key", value: "value")
        
        // Act
        let subject = url.withQueryItem(queryItem)
        
        // Assert
        XCTAssertEqual(subject?.query, "a=b&c=d&key=value")
    }
}

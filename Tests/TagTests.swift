//  Copyright © 2018 Aleph Retamal. All rights reserved.

import XCTest
@testable import CoindarAPI

class TagTests: XCTestCase {
    
    func testDecoding() {
        // Arrange
        let data = TestHelper.data("tag", withExtension: "json")
        
        // Act
        let subject = try? JSONDecoder.snake.decode(Tag.self, from: data)
        
        // Assert
        XCTAssertEqual(subject?.id, "1")
        XCTAssertEqual(subject?.name, "General")
    }
    
}

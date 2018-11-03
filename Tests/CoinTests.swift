//  Copyright © 2018 Aleph Retamal. All rights reserved.

import XCTest
@testable import CoindarAPI

class CoinTests: XCTestCase {
    
    func testDecoding() {
        // Arrange
        let data = TestHelper.data("coin", withExtension: "json")
        
        // Act
        let subject = try? JSONDecoder.snake.decode(Coin.self, from: data)
        
        // Assert
        XCTAssertEqual(subject?.id, "1")
        XCTAssertEqual(subject?.name, "Bitcoin")
        XCTAssertEqual(subject?.symbol, "BTC")
        XCTAssertEqual(subject?.image32.absoluteString, "https://coindar.org/images/coins/bitcoin/32x32.png")
        XCTAssertEqual(subject?.image64.absoluteString, "https://coindar.org/images/coins/bitcoin/64x64.png")
    }
    
}

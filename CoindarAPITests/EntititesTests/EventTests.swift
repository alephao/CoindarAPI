//  Copyright © 2018 Aleph Retamal. All rights reserved.

import XCTest
@testable import CoindarAPI

class EventTests: XCTestCase {
    
    func testDecoding() {
        // Arrange
        let data = TestHelper.data("event", withExtension: "json")
        let decoder = JSONDecoder.snake
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd HH:mm"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        // Act
        let subject = try? decoder.decode(Event.self, from: data)
        
        // Assert
        XCTAssertEqual(subject?.caption, "Listing on OTCBTC")
        XCTAssertEqual(subject?.source.absoluteString, "https://coindar.org/en/event/oraclechain-oct-listing-on-otcbtc-11299")
        XCTAssertEqual(subject?.proof?.absoluteString, "https://support.otcbtc.com/hc/en-us/articles/360007083571")
        XCTAssertEqual(subject?.datePublic, formatter.date(from: "2018-7-09 17:23"))
        XCTAssertEqual(subject?.dateStart, formatter.date(from: "2018-7-11 06:00"))
        XCTAssertNil(subject?.dateEnd)
        XCTAssertEqual(subject?.coinId, "280")
        XCTAssertEqual(subject?.coinPriceChanges, "-12.89")
        XCTAssertEqual(subject?.tags, "9")
    }
    
}

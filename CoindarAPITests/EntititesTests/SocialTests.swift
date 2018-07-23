//  Copyright © 2018 Aleph Retamal. All rights reserved.

import XCTest
@testable import CoindarAPI

class SocialTests: XCTestCase {
    
    func testDecoding() {
        // Arrange
        let data = TestHelper.data("social", withExtension: "json")
        let decoder = JSONDecoder.snake
        
        // Act
        let subject = try? decoder.decode(Social.self, from: data)
        
        // Assert
        XCTAssertEqual(subject?.coinId, "3")
        XCTAssertEqual(subject?.website?.absoluteString, "https://ripple.com/xrp/")
        XCTAssertNil(subject?.bitcointalk)
        XCTAssertEqual(subject?.twitter?.absoluteString, "https://twitter.com/Ripple")
        XCTAssertEqual(subject?.reddit?.absoluteString, "https://reddit.com/r/ripple")
        XCTAssertEqual(subject?.telegram?.absoluteString, "https://t.me/Ripple")
        XCTAssertEqual(subject?.facebook?.absoluteString, "https://facebook.com/ripplepay")
        XCTAssertEqual(subject?.github?.absoluteString, "https://gitgub.com/ripple")
        XCTAssertEqual(subject?.explorer?.absoluteString, "https://xrpcharts.ripple.com/#/graph/")
        XCTAssertEqual(subject?.youtube?.absoluteString, "https://youtube.com/user/ripplevideo1")
        XCTAssertEqual(subject?.twitterCount, "886610")
        XCTAssertEqual(subject?.redditCount, "189502")
        XCTAssertEqual(subject?.telegramCount, "64666")
        XCTAssertEqual(subject?.facebookCount, "125144")
    }
}

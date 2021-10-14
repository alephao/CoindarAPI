//
//  CoindarTests.swift
//  
//
//  Created by Afonso Graça on 13/10/2021.
//

import XCTest
import Moya
@testable import CoindarAPI

final class CoindarTests: XCTestCase {

    private var coindar: Coindar!

    // MARK: - Setup methods
    override func setUp() {
        super.setUp()
        coindar = Coindar(token: "DEADBEEF",
                          stubBehavior: MoyaProvider.immediatelyStub,
                          endpointClosure: { target in
            Endpoint(
                url: URL(target: target).absoluteString,
                sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        })
    }

    override func tearDown() {
        coindar = nil
        super.tearDown()
    }

    // MARK: - Tests
    func testGetCoins() {
        let expectation = expectation(description: "should get back a coin")
        _ = coindar.getCoins(progress: { _ in },
                             onSuccess: { coins in
            expectation.fulfill()
            XCTAssertEqual(coins.count, 1)
            XCTAssertEqual(coins.first?.id, "1")
            XCTAssertEqual(coins.first?.name, "Bitcoin")
            XCTAssertEqual(coins.first?.symbol, "BTC")
        }, onError: { error in
            expectation.fulfill()
            XCTFail("A coin should be coming back")
        })
        wait(for: [expectation], timeout: 1)
    }

    func testGetTags() {
        let expectation = expectation(description: "should get back a tag")
        _ = coindar.getTags(progress: { _ in },
                            onSuccess: { tags in
            expectation.fulfill()
            XCTAssertEqual(tags.count, 1)
            XCTAssertEqual(tags.first?.id, "1")
            XCTAssertEqual(tags.first?.name, "General")
        }, onError: { error in
            expectation.fulfill()
            XCTFail("A tag should be coming back")
        })
        wait(for: [expectation], timeout: 1)

    }

    func testGetEvents() {
        let expectation = expectation(description: "should get back an event")
        _ = coindar.getEvents(params: EventsParams(),
                              onSuccess: { events in
            expectation.fulfill()
            XCTAssertEqual(events.count, 1)
            XCTAssertEqual(events.first?.coinId, "280")
            XCTAssertEqual(events.first?.tags, "9")
        }, onError: { error in
            expectation.fulfill()
            XCTFail("An event should be coming back")
        })
        wait(for: [expectation], timeout: 1)
    }

    func testGetSocial() {
        let expectation = expectation(description: "should get back social info")
        _ = coindar.getSocial(coins: [],
                              onSuccess: { social in
            expectation.fulfill()
            XCTAssertEqual(social.count, 1)
            XCTAssertEqual(social.first?.coinId, "3")
            XCTAssertEqual(social.first?.twitterCount, "886610")
        }, onError: { error in
            expectation.fulfill()
            XCTFail("Social Info should be coming back")
        })
        wait(for: [expectation], timeout: 1)
    }
}

// MARK: - Async/Await tests
@available(iOS 15.0.0, *)
extension CoindarTests {
    func testAsyncGetCoins() async throws {
        let coins = try await coindar.getCoins(progress: { _ in })

        XCTAssertEqual(coins.count, 1)
        XCTAssertEqual(coins.first?.id, "1")
        XCTAssertEqual(coins.first?.name, "Bitcoin")
        XCTAssertEqual(coins.first?.symbol, "BTC")
    }

    func testAsyncGetTags() async throws {
        let tags = try await coindar.getTags(progress: { _ in })

        XCTAssertEqual(tags.count, 1)
        XCTAssertEqual(tags.first?.id, "1")
        XCTAssertEqual(tags.first?.name, "General")

    }

    func testAsyncGetEvents() async throws {
        let events = try await coindar.getEvents(params: EventsParams())

        XCTAssertEqual(events.count, 1)
        XCTAssertEqual(events.first?.coinId, "280")
        XCTAssertEqual(events.first?.tags, "9")
    }

    func testAsyncGetSocial() async throws {
        let social = try await coindar.getSocial(coins: [])

        XCTAssertEqual(social.count, 1)
        XCTAssertEqual(social.first?.coinId, "3")
        XCTAssertEqual(social.first?.twitterCount, "886610")
    }
}

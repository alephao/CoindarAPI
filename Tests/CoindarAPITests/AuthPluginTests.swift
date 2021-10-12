//  Copyright © 2018 Aleph Retamal. All rights reserved.

import XCTest
import Moya
@testable import CoindarAPI

class AuthPluginTests: XCTestCase {
    
    struct TestTarget: TargetType {
        var baseURL: URL { URL(string: "https://mywebsite.com")! }
        var path: String { "/api" }
        var method: Moya.Method { .get }
        var sampleData: Data { Data() }
        var task: Task { .requestPlain }
        var headers: [String : String]? { nil }
    }
    
    func testPluginOnUrlWithNoQueryItems() {
        // Arrange
        let token = "hello"
        let plugin = AuthPlugin(token: token)
        let target = TestTarget()
        let url = URL(string: "https://mywebsite.com/api")!
        let request = URLRequest(url: url)

        // Act
        let subject = plugin.prepare(request, target: target)
        
        // Assert
        XCTAssertEqual(subject.url?.absoluteString, "https://mywebsite.com/api?access_token=hello")
    }
    
    func testPluginOnUrlWithQueryItems() {
        // Arrange
        let token = "hello"
        let plugin = AuthPlugin(token: token)
        let target = TestTarget()
        let url = URL(string: "https://mywebsite.com/api?a=b&c=d")!
        let request = URLRequest(url: url)
        
        // Act
        let subject = plugin.prepare(request, target: target)
        
        // Assert
        XCTAssertEqual(subject.url?.absoluteString, "https://mywebsite.com/api?a=b&c=d&access_token=hello")
    }
    
}

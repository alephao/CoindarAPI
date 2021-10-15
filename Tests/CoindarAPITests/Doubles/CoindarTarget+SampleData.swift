//
//  CoindarTarget+SampleData.swift
//  
//
//  Created by Afonso Graça on 13/10/2021.
//

import Foundation
@testable import CoindarAPI

extension CoindarTarget {
    var sampleData: Data {
        switch self {
        case .coins: return arrayWithContents(from: "coin")
        case .tags: return arrayWithContents(from: "tag")
        case .events: return arrayWithContents(from: "event")
        case .social: return arrayWithContents(from: "social")
        }
    }

    private func arrayWithContents(from jsonFile: String) -> Data {
        let url = TestHelper.url(jsonFile, withExtension: "json")
        guard let jsonString = try? String(contentsOf: url) else {
            return Data()
        }
        return "[\(jsonString)]".data(using: .utf8) ?? Data()
    }
}

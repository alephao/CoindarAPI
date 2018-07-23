//  Copyright © 2018 Aleph Retamal. All rights reserved.

import Foundation

public struct Event: Codable {
    public let caption: String
    public let source: URL
    public let proof: URL
    public let datePublic: Date
    public let dateStart: Date
    public let dateEnd: Date?
    public let coinId: String
    public let coinPriceChanges: String
    public let tags: String
}

extension Event {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        caption = try container.decode(String.self, forKey: .caption)
        source = try container.decode(URL.self, forKey: .source)
        proof = try container.decode(URL.self, forKey: .proof)
        datePublic = try container.decode(Date.self, forKey: .datePublic)
        dateStart = try container.decode(Date.self, forKey: .dateStart)
        dateEnd = try? container.decode(Date.self, forKey: .dateEnd)
        coinId = try container.decode(String.self, forKey: .coinId)
        coinPriceChanges = try container.decode(String.self, forKey: .coinPriceChanges)
        tags = try container.decode(String.self, forKey: .tags)
    }
}

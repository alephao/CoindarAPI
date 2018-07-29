//  Copyright © 2018 Aleph Retamal. All rights reserved.

import Foundation

public struct EventsParams: Codable {
    public let page: String?
    public let pageSize: String?
    public let filterDateStart: String?
    public let filterDateEnd: String?
    public let filterCoins: String?
    public let filterTags: String?
    public let sortBy: String?
    public let orderBy: String?
}

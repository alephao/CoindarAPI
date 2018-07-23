//  Copyright © 2018 Aleph Retamal. All rights reserved.

import Foundation

struct EventsParams: Codable {
    let page: String?
    let pageSize: String?
    let filterDateStart: String?
    let filterDateEnd: String?
    let filterCoins: String?
    let filterTags: String?
    let sortBy: String?
    let orderBy: String?
}

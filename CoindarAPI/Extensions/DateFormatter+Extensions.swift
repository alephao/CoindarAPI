//  Copyright © 2018 Aleph Retamal. All rights reserved.

import Foundation

extension DateFormatter {
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}

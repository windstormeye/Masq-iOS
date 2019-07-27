//
//  String.swift
//  masq
//
//  Created by PJHubs on 2019/7/4.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import Foundation
import CryptoKit

extension String {
    var sha256: String {
        let inputData = Data(self.utf8)
        return String(SHA256.hash(data: inputData).description)
    }
    
    static func timestampe() -> String {
        let dataNow = Date()
        var finishDate = Int(dataNow.timeIntervalSince1970)
        finishDate = finishDate / 300
        return "\(finishDate)"
    }
}

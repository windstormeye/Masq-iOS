//
//  String+Date.swift
//  masq
//
//  Created by 翁培钧 on 2019/7/31.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import Foundation

extension String {
    enum DateType {
        case `default`
    }
    
    static func date(type: DateType? = nil) -> String {
        let dformatter = DateFormatter()
        
        switch type {
        case .default:
            dformatter.dateFormat = "MM-dd HH:mm"
            return dformatter.string(from: Date())
        case .none:
            dformatter.dateFormat = "MM-dd HH:mm"
            return dformatter.string(from: Date())
        }
    }
}

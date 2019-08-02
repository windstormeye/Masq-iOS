//
//  Color+Extension.swift
//  masq
//
//  Created by 翁培钧 on 2019/7/31.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

extension Color {
    static func avatar(_ index: Int) -> Color {
        switch index {
        case -1:
        return Color.clear
        case 0:
            return Color.pink
        case 1:
            return Color.blue
        case 2:
            return Color.green
        case 3:
            return Color.orange
        case 4:
            return Color.yellow
        case 5:
            return Color.gray
        default:
            return Color.gray
        }
    }
}

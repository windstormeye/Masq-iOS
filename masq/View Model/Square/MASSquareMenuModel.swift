//
//  MASSquareMenuModel.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/5.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI
import Combine

class MASSquareMenuViewModel: ObservableObject {

    @Published var items = [
        Item(itemName: "笔记", itemImageName: "square.and.pencil"),
        Item(itemName: "广场", itemImageName: "burst"),
        Item(itemName: "通知", itemImageName: "bell"),
        Item(itemName: "收藏", itemImageName: "pin"),
        Item(itemName: "设置", itemImageName: "ellipsis.circle")
    ]
}

extension MASSquareMenuViewModel {
    struct Item {
        var itemName: String
        var itemImageName: String
        
    }
}

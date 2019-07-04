//
//  Static.swift
//  masq
//
//  Created by PJHubs on 2019/7/5.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import Foundation

struct Error {
    let errorCode: Int
    let errorMsg: String
}

/// debug 模式下才能执行的代码块
func debugOnly(_ body: () -> Void) {
    assert({body(); return true}())
}

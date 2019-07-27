//
//  User.swift
//  masq
//
//  Created by 翁培钧 on 2019/7/27.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import Foundation

class MASUser {
    static let shared = MASUser()
    var model = Model()
    
    init() {
        
    }
}

extension MASUser {
    struct Model: Codable, Hashable {
        var nickname: String
        var token: String
        var uid: Int
        var avatar: Avatar
        
        init() {
            nickname = ""
            token = ""
            uid = -1
            avatar = Avatar()
        }
        
        func uidString() -> String {
            return String(uid)
        }
    }

    struct Avatar: Codable, Hashable {
        var color: Int
        var image: Int
        
        init() {
            color = -1
            image = -1
        }
    }

}

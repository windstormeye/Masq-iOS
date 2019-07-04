//
//  UserService.swift
//  masq
//
//  Created by PJHubs on 2019/7/4.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import Foundation
import CryptoKit
import CommonCrypto

extension MASUser {
    /// 创建用户
    func create(phoneNumber: String,
                authCode: String,
                password: String,
                complatedHandler: @escaping (() -> Void),
                failedHandler: ((Error) -> Void)) {
        var params = [
            "phoneNumber": phoneNumber,
            "password": (password + phoneNumber.reversed()).sha256,
            "authCode": authCode
        ]
        
        MASNetwork.shared.post(path: .userCreate,
                               parameters: &params,
                               complement: {
                                print($0)
        }) {
            print($0)
        }
    }
}

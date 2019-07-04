//
//  BlogModel.swift
//  masq
//
//  Created by PJHubs on 2019/7/4.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import Foundation
import Combine

struct MASBlogModel: Codable {
    /// 文章 ID
    var id: Int
    /// 文章内容
    var content: String
    /// 创建者 ID
    var uid: Int
    /// 文章类型
    var type: MASBlogType
    /// 作者头像
    var avatar_image: Int
    /// 作者头像颜色
    var avatar_color: Int
    /// 创建时间
    var created_time: Int

    init() {
        id = 0
        content = ""
        uid = 0
        type = .normal
        avatar_color = 0
        avatar_image = 0
        created_time = 0
    }
}

enum MASBlogType: Int, Codable {
    /// 只有文本
    case normal = 0
    /// 带链接
    case link
    /// 带 flag
    case flag
}

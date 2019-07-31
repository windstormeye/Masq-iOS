//
//  MASAvatarView.swift
//  masq
//
//  Created by 翁培钧 on 2019/7/31.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASAvatarView: View {
    
    var avatarImage: Int
    var avatarColor: Int
    
    var body: some View {
        Image("\(avatarImage)")
            .resizable()
            .frame(width: 50.0, height: 50.0)
            .background(Color.avatar(avatarColor))
            .cornerRadius(40)
    }
}

#if DEBUG
//struct MASAvatarView_Previews: PreviewProvider {
//    static var previews: some View {
//        MASAvatarView()
//    }
//}
#endif

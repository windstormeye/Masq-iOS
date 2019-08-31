//
//  MASSearchBar.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/20.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASSearchBar: View {
    @Binding var text: String
    
    @State var isFirstResponder = false
    @State var showCancleButton = false
    
    var cancle: (() -> ())?
    var search: ((String) -> ())?
    
    var body: some View {
        HStack {
            MASSearchBarContanierView(text: $text,
                                      isFirstResponder: $isFirstResponder,
                                      showCancleButton: $showCancleButton) {
                                        self.search?($0)
            }
        
            Button("取消") {
                self.text = ""
                self.isFirstResponder = false
                self.showCancleButton = false
                
                self.cancle?()
            }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: showCancleButton ? 8 : -44))
                .foregroundColor(.black)
        }
            // 加上这个动画后，第一次运行 app 时会因为设置 frame 发生改变而调用一次。
            // 导致搜索框从下往上动了一次
            .animation(.default)
    }
}

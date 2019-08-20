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
    
    var cancle: (() -> ())?
    
    var body: some View {
        
        NavigationView {
            HStack {
                    MASSearchBarContanierView(text: $text)
            
                    Button("取消") {
                        self.text = ""
                        self.cancle?()
                    }
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                        .foregroundColor(.black)
                }
                    .animation(.easeIn)
        }
    }
}

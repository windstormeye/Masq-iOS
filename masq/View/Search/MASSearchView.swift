//
//  MASSearchView.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/20.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI


struct MASSearchView: View {
    @Binding var showingSeachBar: Bool
    
    @State private var inputText = ""
    @State private var isActiveBar = true
        
    var body: some View {
        VStack {
            MASSearchBar(text: $inputText) {
                // TODO: 想想这里怎么改？加上过渡动画和 pop
                self.showingSeachBar = false
            }
                .padding(10)
            
            Spacer()
        }
        .onAppear {
            self.showingSeachBar = true
        }
    }
}

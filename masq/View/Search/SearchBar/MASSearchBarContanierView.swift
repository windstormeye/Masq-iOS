//
//  MASSearchBarContanierView.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/20.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASSearchBarContanierView: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("你想找什么？", text: $text)
            
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "multiply.circle")
                }
            }
        }
            .padding(10)
            .background(Color(red: 240/255, green: 240/255, blue: 240/255))
            .cornerRadius(5)
    }
}


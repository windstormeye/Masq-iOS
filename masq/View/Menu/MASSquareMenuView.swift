//
//  MASSquareMenuView.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/2.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASSquareMenuCell<Content: View>: View {
    var itemName: String
    var itemImageName: String
    var content: () -> Content

    var body: some View {
        NavigationLink(destination: content()) {
            HStack {
                // 限定 `Image`
                HStack {
                    Image(systemName: itemImageName)
                        .imageScale(.medium)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 20))
                }
                    .frame(width: 50)

                Text(itemName)

                Spacer()
            }
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                .frame(width: 130)
        }
    }
}

struct MASSquareMenuView<Content: View>: View {
    @Binding var isShowMenu: Bool

    var content: () -> Content
    
    var body: some View {
        GeometryReader { _ in
            // 顶部箭头
            Image(systemName: "triangle.fill")
                .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
            
            VStack(alignment: .leading) {
                self.content()
            }
                .background(Color.black)
                .cornerRadius(5)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            
            Spacer()
        }
            .background(Color.white.opacity(0.01))
            .frame(minWidth: UIScreen.main.bounds.width, minHeight: UIScreen.main.bounds.height)
            .onTapGesture {
                self.isShowMenu.toggle()
            }
    }
}

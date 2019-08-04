//
//  MASSquareMenuView.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/2.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASSquareMenuView: View {

    @Binding var isShowMenu: Bool
    
    var body: some View {
        GeometryReader { geo in
            
            Image(systemName: "triangle.fill")
                .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                
            VStack(alignment: .leading) {
                Text("Hello World!")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10))
                Text("Hello World!")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                Text("Hello World!")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10))
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

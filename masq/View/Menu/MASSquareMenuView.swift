//
//  MASSquareMenuView.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/2.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASSquareMenuView: View {
    @EnvironmentObject var squareListViewModel: MASSquareListViewModel
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 10) {
                Text("Hello World!")
                    .foregroundColor(.white)
                Text("Hello World!")
                    .foregroundColor(.white)
                Text("Hello World!")
                .foregroundColor(.white)
            }
        }
        .onTapGesture {
            
        }
        .navigationBarItems(leading: Button(action: {
            self.squareListViewModel.isShowMenu = false
            
        }, label: {
            Text("Hello World!")
        }))
            .background(Color.black)
    }
}

#if DEBUG
struct MASSquareMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MASSquareMenuView()
    }
}
#endif

//
//  MASSquareHostView.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/3.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASSquareHostView: View {
    
    @EnvironmentObject var squareListViewModel: MASSquareListViewModel

    @State private var showingInputView = false
    @State private var showingMenuView = false
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                AnyView(
                    ZStack {
                        MASSquareListView(squareListViewModel: self.squareListViewModel)
                        
                        if self.showingMenuView {
                            MASSquareMenuView(isShowMenu: self.$showingMenuView)
                        }
                    }
                    .navigationBarTitle(Text("广场"))
                    .navigationBarItems(leading:
                        Button(action: {
                            self.showingMenuView.toggle()
                        }, label: {
                            Image(systemName: "list.dash")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                        }), trailing:
                        Button(action: {
                            self.showingInputView.toggle()
                        }, label: {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.large)
                                .foregroundColor(.primary)
                        })
                    )
                        .sheet(isPresented: self.$showingInputView) {
                        InputView {
                            self.showingInputView.toggle()
                        }
                    }
                )
            }
        }
    }
}

#if DEBUG
struct MASSquareHostView_Previews: PreviewProvider {
    static var previews: some View {
        MASSquareHostView()
    }
}
#endif

//
//  MASSquareHostView.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/3.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI
import Combine

struct MASSquareHostView: View {
    
    @State private var showingSheet = false
    @State private var showingInputView = false
    @State private var showingMenuView = false
    @State private var showingSeachBar = false
    @State private var inputText = ""

    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                AnyView(
                    ZStack {
                        VStack {
                            MASSearchBarContanierView(text: self.$inputText)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                                
                            
                            MASSquareListView(showingSheet: self.$showingSheet)
                        }
                        
                        if self.showingMenuView {
                            MASSquareMenuView(isShowMenu: self.$showingMenuView) {
                                Group {
                                    MASSquareMenuCell(itemName: "笔记", itemImageName: "square.and.pencil") {
                                        InputView()
                                    }
                                    MASSquareMenuCell(itemName: "广场", itemImageName: "burst") {
                                        InputView()
                                    }
                                    MASSquareMenuCell(itemName: "通知", itemImageName: "bell") {
                                        InputView()
                                    }
                                    MASSquareMenuCell(itemName: "收藏", itemImageName: "pin") {
                                        InputView()
                                    }
                                    MASSquareMenuCell(itemName: "设置", itemImageName: "ellipsis.circle") {
                                        InputView()
                                    }
                                }
                            }
                        }
                    }
                        .navigationBarHidden(self.showingSeachBar)
                        .navigationBarTitle(Text("广场"), displayMode: .inline)
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

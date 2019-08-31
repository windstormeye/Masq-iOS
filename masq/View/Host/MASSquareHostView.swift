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
    
    @ObservedObject var aritcleManager = AritcleManager()
    
    @State private var showingSheet = false
    @State private var showingInputView = false
    @State private var showingMenuView = false
    @State private var showingSeachBar = false
    @State var isPresenting = false

    @State private var inputText = ""

    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                AnyView(
                    ZStack {
                        VStack() {
                            MASSearchBar(text: self.$inputText, cancle: {
                                self.showingSeachBar = false
                                self.aritcleManager.reload()
                            }) {
                                self.aritcleManager.search(content: $0)
                            }
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                            
                            MASSquareListView(articles: self.$aritcleManager.articles,
                                              showingSheet: self.$showingSheet) {
                                                self.aritcleManager.articles[$0].delete()
                            }
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
                        .navigationBarTitle(Text("笔记"), displayMode: .inline)
                        .navigationBarItems(leading:
                            Button(action: {
                                self.showingMenuView.toggle()
                            }, label: {
                                Image(systemName: "list.dash")
                                .imageScale(.large)
                                .foregroundColor(.primary)
                            })
                                .frame(width: 25, height: 25)
                            , trailing:
                            HStack {
                                Button(action: {
                                    self.showingInputView.toggle()
                                }, label: {
                                    Image(systemName: "square.and.pencil")
                                        .imageScale(.large)
                                        .foregroundColor(.primary)
                                })
                                    .frame(width: 25, height: 25)
                            }
                        
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

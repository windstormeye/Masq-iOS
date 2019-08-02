//
//  ContentView.swift
//  masq
//
//  Created by PJHubs on 2019/7/4.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var showingInputView = false
    @State var articleManage = AritcleManager()
    @State var isShowMenu = false
    
    var inputButton: some View {
            Button(action: { self.showingInputView.toggle() }) {
                Image(systemName: "square.and.pencil")
                    .imageScale(.large)
                    .padding()
            }
        }
    
    var body: some View {
        NavigationView {
            VStack {
                if self.isShowMenu {
                    MASSquareMenuView()
                }
                List(self.articleManage.articles, id: \.createdAt) { article in
                    MASSquareNormalCellView(article: article)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                }
                    .navigationBarTitle(Text("广场"))
                    .navigationBarItems(leading:
                        Button(action: {
                            self.isShowMenu.toggle()
                        }, label: {
                            Image(systemName: "list.dash")
                                .imageScale(.large)
                                .foregroundColor(.primary)
                        }) , trailing:
                        Button(action: {
                            self.showingInputView.toggle()
                        }, label: {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.large)
                                .foregroundColor(.primary)
                        })
                    )
                    .sheet(isPresented: $showingInputView) {
                        InputView {
                            self.showingInputView.toggle()
                        }
                    }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().environment(\.colorScheme, .dark)
        }
    }
}
#endif


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
    
    var inputButton: some View {
            Button(action: { self.showingInputView.toggle() }) {
                Image(systemName: "square.and.pencil")
                    .imageScale(.large)
                    .padding()
            }
        }
    
    var body: some View {
        NavigationView {
            List(self.articleManage.articles, id: \.createdAt) { article in
                MASSquareNormalCellView(article: article)
            }
                .navigationBarTitle(Text("广场"))
                .navigationBarItems(leading:
                    Button(action: {
                    
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
                .listStyle(.grouped)
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


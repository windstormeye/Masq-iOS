//
//  ContentView.swift
//  masq
//
//  Created by PJHubs on 2019/7/4.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASSquareListView : View {
    
    @State var articleManage = AritcleManager()
    @State var squareListViewModel: MASSquareListViewModel
    
    var a = ["2333", "2333", "2333", "2333"]
    
    var onDelete: ((Int) -> ())?
    
    var body: some View {
        List {
            ForEach(self.articleManage.articles) { article in
                MASSquareNormalCellView(article: article)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            }
            .onDelete {
                guard let index = Array($0).first else { return }
                // TODO: 连接 Core Data 删除
                self.articleManage.articles.remove(at: index)
            }
        }
    
    }
}




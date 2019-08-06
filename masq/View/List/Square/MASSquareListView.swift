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
    
    var body: some View {
        List(self.articleManage.articles, id: \.createdAt) { article in
            MASSquareNormalCellView(article: article)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }
    }
}




//
//  ContentView.swift
//  masq
//
//  Created by PJHubs on 2019/7/4.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASSquareListView : View {
    
    @ObservedObject var aritcleManager = AritcleManager()
    @Binding var showingSheet: Bool
        
    var onDelete: ((Int) -> ())?
    
    var body: some View {
        List {
            ForEach(self.aritcleManager.articles) { article in
                MASSquareNormalCellView(article: article)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            }
            .onDelete {
                guard let index = Array($0).first else { return }
                self.aritcleManager.articles[index].delete()
            }
        }
    
    }
}




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
    
    
    var body: some View {
        NavigationView {
            MASSquareListView(squareListViewModel: squareListViewModel)
                .navigationBarTitle(Text("广场"))
                .navigationBarItems(leading:
                    NavigationLink(destination: MASSquareMenuView(), isActive: $squareListViewModel.isShowMenu) {
                        Image(systemName: "list.dash")
                        .imageScale(.large)
                        .foregroundColor(.primary)
                    }
                    , trailing:
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

#if DEBUG
struct MASSquareHostView_Previews: PreviewProvider {
    static var previews: some View {
        MASSquareHostView()
    }
}
#endif

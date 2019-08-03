//
//  InputView.swift
//  masq
//
//  Created by 翁培钧 on 2019/7/27.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI
import Combine

struct InputView: View {
    @State private var textString = ""
    
    var commit: (() -> ())?
    
    let now = Date()
    // 当前时间字符串
    var nowTimeString: String {
        get {
            let dformatter = DateFormatter()
            dformatter.dateFormat = "yyyy年MM月dd日 HH:mm"
            return dformatter.string(from: now)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center) {
                Image("5")
                    .resizable()
                    .frame(width: 50.0,
                           height: 50.0)
                    .background(Color.green)
                    .cornerRadius(40)
                    .padding(EdgeInsets(top: 20,
                                        leading: 20,
                                        bottom:0,
                                        trailing: 0))
                
                Spacer()
                
                Button(action: {
                    MASCoreData.shared.persistentContainer.viewContext.performChanges {
                        
                        var article = Article.ViewModel()
                        article.content = self.textString
                        article.avatarColor = 0
                        article.avatarImage = 0
                        article.type = 0

                        _ = Article.insert(viewModel: article)
                        
                        self.commit?()
                    }
                }) {
                    Image(systemName: "checkmark")
                        .imageScale(.large)
                        .foregroundColor(.primary)
                }
                    .padding(EdgeInsets(top: 20,
                                        leading: 0,
                                        bottom:0,
                                        trailing: 20))
            }
            
            MASTextView(placeholder: "在 \(nowTimeString) 写下") { (text) in
                self.textString = text
            }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .topLeading)
                .padding(EdgeInsets(top: 0,
                                    leading: 20,
                                    bottom:0,
                                    trailing: 20))
        }
    }
}


#if DEBUG
struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
#endif

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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center) {
                Image("5")
                    .resizable()
                    .frame(width: 50.0, height: 50.0)
                    .background(Color.green)
                    .cornerRadius(40)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom:0, trailing: 0))
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "paperplane.fill")
                        .imageScale(.large)
                        .foregroundColor(.primary)
                }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom:0, trailing: 20))
            }
            
            MASTextView()
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .topLeading)
                .padding(EdgeInsets(top: 0, leading: 20, bottom:0, trailing: 20))
        }
    }
}


struct MASTextView: UIViewRepresentable {
    let now = Date()
    
    var isBeginEditng = false
    var nowTimeString: String {
        get {
            let dformatter = DateFormatter()
            dformatter.dateFormat = "yyyy年MM月dd日 HH:mm"
            return dformatter.string(from: now)
        }
    }
    
    func makeCoordinator() -> MASTextView.Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let tv = UITextView()
        tv.tintColor = .black
        tv.font = UIFont.systemFont(ofSize: 18)
        tv.delegate = context.coordinator
        
        tv.text = "在 \(nowTimeString) 写下"
        return tv
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var textView: MASTextView
        
        init(_ textView: MASTextView) {
            self.textView = textView
        }
        
        func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
            if !self.textView.isBeginEditng {
                self.textView.isBeginEditng = true
                textView.text = ""
            }
            return true
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

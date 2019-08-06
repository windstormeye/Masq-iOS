//
//  MultilineTextView.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/3.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MultilineTextView: UIViewRepresentable  {
    
    @Binding var text: String
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        let text: Binding<String>
        // 是否开始编辑
        private(set) var isBeginEditng = false
        
        init(text: Binding<String>) {
            self.text = text
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.text.value = textView.text ?? ""
        }
        
        func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
            
            if !isBeginEditng {
                isBeginEditng = true
                textView.text = ""
            }
            return true
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.delegate = context.coordinator
        view.becomeFirstResponder()
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

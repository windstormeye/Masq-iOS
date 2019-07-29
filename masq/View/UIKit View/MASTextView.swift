//
//  MASTextView.swift
//  masq
//
//  Created by 翁培钧 on 2019/7/28.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASTextView: UIViewRepresentable {
    
    @Binding var textString: String
    var placeholder = ""
    
    // 文本改变
    var changeHandler:(() -> Void)?
    // 按下 `return`
    var onCommitHandler:(() -> Void)?
    
    
    func makeCoordinator() -> MASTextView.Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MASTextView>) -> UITextView {
        let tv = UITextView()
        tv.tintColor = .black
        tv.font = UIFont.systemFont(ofSize: 18)
        tv.delegate = context.coordinator
        tv.returnKeyType = .done
        tv.text = placeholder
        
        return tv
    }
    
    func updateUIView(_ uiView: UITextView,
                      context: UIViewRepresentableContext<MASTextView>) {
        if context.coordinator.isBeginEditng {
            uiView.text = textString
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        var masTextView: MASTextView
        // 是否开始编辑
        private(set) var isBeginEditng = false
        
        
        init(_ textView: MASTextView) {
            self.masTextView = textView
        }
        
        // MARK: UITextView Delegate
        func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
            if !isBeginEditng {
                isBeginEditng = true
                textView.text = ""
            }
            return true
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
        }
        
        func textView(_ textView: UITextView,
                      shouldChangeTextIn range: NSRange,
                      replacementText text: String) -> Bool {
            if text == "\n" {
                textView.resignFirstResponder()
                
                masTextView.textString = textView.text
                masTextView.onCommitHandler?()
                
                return false
            }
            return true
        }
    }
}

//
//  MASSearchBarContanierView.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/20.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASSearchBarContanierView: View {
    @Binding var text: String
    @State private var isFirstResponder = false
    
//    var isBeginEdit: (() -> ())?
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            CustomTextField(text: $text, isFirstResponder: $isFirstResponder)
                .frame(height: 20)
            
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                    self.isFirstResponder = false
                }) {
                    Image(systemName: "multiply.circle")
                }
                    .foregroundColor(.black)
            }
        }
            .padding(10)
            .background(Color(red: 240/255, green: 240/255, blue: 240/255))
            .cornerRadius(5)
    }
}


struct CustomTextField: UIViewRepresentable {

    class Coordinator: NSObject, UITextFieldDelegate {

        @Binding var text: String
        @Binding var isFirstResponder: Bool


        init(text: Binding<String>, isFirstResponder: Binding<Bool>) {
            _text = text
            _isFirstResponder = isFirstResponder
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            isFirstResponder = true
        }

    }

    @Binding var text: String
    @Binding var isFirstResponder: Bool

    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        return textField
    }

    func makeCoordinator() -> CustomTextField.Coordinator {
        return Coordinator(text: $text, isFirstResponder: $isFirstResponder)
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
        
        if isFirstResponder {
            uiView.becomeFirstResponder()
        } else {
            uiView.resignFirstResponder()
        }
    }
}

//
//  MCITextField.swift
//  PocUIPix
//
//  Created by Thais Morimoto on 28/04/22.
//

import SwiftUI

struct MCITextField<WhateverYouWant: View> : View {

    let text: Binding<String>
    let placeholder: String
    let content: WhateverYouWant
    
    init(_ placeholder: String, text: Binding<String>, @ViewBuilder content: () -> WhateverYouWant) {
        self.text = text
        self.placeholder = placeholder
        self.content = content()
    }

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text(placeholder).font(.title2)
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField(placeholder, text: text)
                }.underlineTextField()
            }.padding()
        }
    }
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(.grayDividerColor)
            .padding(10)
    }
}

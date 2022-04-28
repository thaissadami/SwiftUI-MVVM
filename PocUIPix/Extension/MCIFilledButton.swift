//
//  MCIFilledButton.swift
//  PocUIPix
//
//  Created by Thais Morimoto on 27/04/22.
//

import SwiftUI

struct MCIFilledButton<WhateverYouWant: View> : View {

    let action: () -> Void
    let content: WhateverYouWant
    
    init(action: @escaping () -> Void, @ViewBuilder content: () -> WhateverYouWant) {
        self.action = action
        self.content = content()
    }

    var body: some View {
        
        Button(action: action) {
            content
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.title3)
                .foregroundColor(Color.black)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color.primaryColor)
                )
        }
    }
}

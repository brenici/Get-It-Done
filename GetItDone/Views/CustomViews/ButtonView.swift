//
//  ButtonView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let cornerRadius: CGFloat = 10
    let textColor: Color = Color.white
    let tint: Color?
    let font: Font = .system(size: 20, weight: .medium)
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                buttonLabel
            }
        }
        .tint(tint)
        .buttonStyle(.borderedProminent)
    }
    
    @ViewBuilder private var buttonLabel: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .font(font)
            .foregroundColor(textColor)
    }
    
}

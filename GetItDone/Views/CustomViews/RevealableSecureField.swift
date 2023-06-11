//
//  RevealableSecureField.swift
//  Get It Done
//
//  Created by Emilian Brenici on 11/06/2023.
//

import SwiftUI

/// A custom SwiftUI view representing a secure text input field with a password visibility toggle.
///
/// Use `RevealableSecureField` to replace a `SecureField` and to allow the user to enter a password, while having the option to reveal or hide the entered text by pressing the button.
/// - Note: `RevealableSecureField` supports password strength indication based on the length of the entered text.
struct RevealableSecureField: View {
    
    var placeholder = ""
    @Binding var text: String
    @State var isPasswordVisible: Bool = false
    
    var body: some View {
        HStack(spacing: 8) {
            if isPasswordVisible {
                TextField(placeholder, text: $text)
                    .frame(maxHeight: .infinity)
                    .opacity(isPasswordVisible ? 1 : 0)
                    .textFieldStyle(.plain)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .foregroundColor(
                        text.count < 8 ? .red : text.count > 11 ? .green : .orange
                    )
            } else {
                SecureField(placeholder, text: $text)
                    .frame(maxHeight: .infinity)
                    .opacity(isPasswordVisible ? 0 : 1)
                    .textFieldStyle(.plain)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .foregroundColor(
                        text.count < 8 ? .red : text.count > 11 ? .green : .orange
                    )
            }
            Button {
                isPasswordVisible.toggle()
            } label: {
                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(.gray).opacity(0.8)
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width: 44)
            .padding(0)
        }
        .padding(.trailing, -10)
    }
    
}

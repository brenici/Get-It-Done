//
//  SignUpView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

///  A Sign-up View for registration of new users.
struct SignUpView: View {

    @StateObject var viewModel = SignUpViewViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Form {
                TextField("FullName", text: $viewModel.fullName)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                TextField("Email", text: $viewModel.email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Repeat Password", text: $viewModel.repeatedPassword)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                ButtonView(
                    title: "Sign Up",
                    tint: .orange
                ) {
                    viewModel.signUp()
                }
                .padding(.vertical, 10)
            }
            VStack (spacing: 10) {
                Text("Already Registered?")
                Button {
                    dismiss()
                } label: {
                    Text("Back to Log In")
                }
            }
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        SignUpView()
    }
    
}

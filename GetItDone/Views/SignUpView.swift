//
//  SignUpView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

struct SignUpView: View {

    @StateObject var viewModel = SignUpViewViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Form {
                TextField("Email", text: $viewModel.email)
                SecureField("Password", text: $viewModel.password)
                SecureField("Repeat Password", text: $viewModel.repeatedPassword)
                Button {
                    viewModel.login()
                } label: {
                    Text("Sign Up")
                }
                .frame(maxWidth: .infinity)
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

//
//  SignUpView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

///  A Sign-up View for registration of new users.
///
/// The view contains the following elements:
/// - a Header
/// - a sign-up `Form` with four fields [`Full Name`, `Email`, `Password` and `Repeat Password`] and a `Sign Up` button
/// - a button (navigation link) to dismiss the `SignUpView` and return to `LoginView`
struct SignUpView: View {
    
    @StateObject var viewModel = SignUpViewModel()
    @Environment(\.dismiss) private var dismiss
    let headerHeight = UIScreen.main.bounds.height / 3

    var body: some View {
        ZStack {
            VStack {
                HeaderView(
                    title: "Register now!",
                    subtitle: "Get Things Done",
                    height: headerHeight,
                    background: .purple,
                    sidesRatio: 10 / 7,  // left cut
                    controlPointRatio: (x: 0.7, y: 0.1)
                )
                Spacer()
            }
            .zIndex(2)
            VStack {
                signUpForm
                VStack (spacing: 10) {
                    Text("Already Registered?")
                        .opacity(0.5)
                    Button {
                        dismiss()
                    } label: {
                        Text("Back to Log In")
                    }
                    .accentColor(.blue)
                }
                .padding(.bottom, UIScreen.main.bounds.height * 0.1)
            }
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder var signUpForm: some View {
        Form {
            Section (
                header:
                    VStack {
                        Spacer()
                        ErrorMessageView(errorMessage: $viewModel.errorMessage)
                    }
                    .frame(maxWidth: .infinity, minHeight: headerHeight - 16)
            ) {
                TextField("FullName", text: $viewModel.fullName)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                TextField("Email", text: $viewModel.email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                RevealableSecureField(placeholder: "Password", text: $viewModel.password)
                RevealableSecureField(placeholder: "Repeat Password", text: $viewModel.repeatedPassword)
                ButtonView(
                    title: "Sign Up",
                    tint: .orange
                ) {
                    viewModel.signUp()
                }
                .padding(.vertical, 10)
            }
        }
        .padding(.top, 0)
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        SignUpView()
    }
    
}

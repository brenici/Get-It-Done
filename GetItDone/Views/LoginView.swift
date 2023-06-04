//
//  LoginView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

/// A Login View for user authentication using email and password
///
/// The view contains the following elements:
/// - a Header,
/// - a login `Form` with two fields [`email` and `password`] and a `Login` button
/// - a navigation link to `SignUpView` for new users
struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(
                    title: "Get It Done",
                    subtitle: "Empower Your Productivity",
                    background: .red
                )
                loginForm
                VStack (spacing: 10) {
                    Text("New user? Get It Done now!")
                        .opacity(0.5)
                    NavigationLink(
                        "Create An Account",
                        destination: SignUpView()
                    )
                   .accentColor(.blue)
                }
                .padding(.bottom, UIScreen.main.bounds.height * 0.1)
            }
            .ignoresSafeArea()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.white)
    }
    
    @ViewBuilder var loginForm: some View {
        Form {
            Section (
                header: ErrorMessageView(errorMessage: $viewModel.errorMessage)
            ) {
                TextField("Email", text: $viewModel.email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                ButtonView(
                    title: "Log In",
                    tint: .blue
                ) {
                    viewModel.login()
                }
                .padding(.vertical, 10)
            }
        }
        .padding(.top, 0)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
    
}

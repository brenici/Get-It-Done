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

    let headerHeight = UIScreen.main.bounds.height / 3
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    HeaderView(
                        title: "Get It Done",
                        subtitle: "Empower Your Productivity",
                        height: headerHeight,
                        background: .blue,
                        sidesRatio: 7 / 10, // right cut
                        controlPointRatio: (x: 0.3, y: 0.1)
                    )
                    Spacer()
                }
                .zIndex(2)
                VStack {
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
            }
            .ignoresSafeArea()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.white)
    }
    
    @ViewBuilder var loginForm: some View {
        Form {
            Section (
                header:
                    VStack {
                        Spacer()
                        ErrorMessageView(errorMessage: $viewModel.errorMessage)
                    }
                    .frame(maxWidth: .infinity, minHeight: headerHeight - 16)
            ) {
                TextField("Email", text: $viewModel.email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                ButtonView(
                    title: "Log In",
                    tint: .green
                ) {
                    viewModel.login()
                }
                .padding(.vertical, 10)
            }
        }
        .padding(.top, 0)
        .onAppear {
            // clear the password for security reasons
            viewModel.password = ""
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
    
}

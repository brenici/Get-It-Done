//
//  LoginView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

///  A Login View for existing user authentication.
struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Email", text: $viewModel.email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    Button {
                        viewModel.login()
                    } label: {
                        Text("Log In")
                    }
                    .frame(maxWidth: .infinity)
                }
                VStack (spacing: 10) {
                    Text("New user? Get It Done now!")
                    NavigationLink(
                        "Create An Account",
                        destination: SignUpView()
                    )
                }
            }
            .navigationTitle("Login")
        }
        .navigationViewStyle(.stack)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
    
}

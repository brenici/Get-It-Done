//
//  ErrorMessageView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

struct ErrorMessageView: View {
    
    @Binding var errorMessage: String

    var body: some View {
        VStack {
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .opacity(1)
                    .transition(.opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.easeInOut(duration: 0.8)) {
                                self.errorMessage = ""
                            }
                        }
                    }
            } else {
                Text(errorMessage)
                    .opacity(0)
                    .transition(.opacity)
            }
        }
        .foregroundColor(.red)
        .textCase(nil)
        .font(.system(size: 15))
    }
}

struct ErrorMessageView_Previews: PreviewProvider {
    
    static var previews: some View {
        ErrorMessageView(errorMessage: Binding(get: {
            return "Error message..."
        }, set: { _ in
            //
        }))
    }
    
}

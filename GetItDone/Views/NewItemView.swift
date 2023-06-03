//
//  NewItemView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var isNewItemPresented: Bool

    var body: some View {
        VStack(spacing: 0) {
            Text("New Item")
                .font(.title3)
                .bold()
                .padding(.top, 20)
            Form {
                Section (
                    header: ErrorMessageView(errorMessage: $viewModel.errorMessage)
                ) {
                    TextField("Title", text: $viewModel.title)
                    DatePicker("Due Date and Time", selection: $viewModel.dueTime)
                        .datePickerStyle(.graphical)
                    ButtonView(
                        title: "Save",
                        tint: .green
                    ) {
                        if viewModel.validate() {
                            viewModel.saveNewItem()
                            isNewItemPresented = false
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
        }
        Spacer()
    }

}

struct NewItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        NewItemView(isNewItemPresented: Binding(get: {
            return true
        }, set: { _ in
            //
        }))
    }
    
}

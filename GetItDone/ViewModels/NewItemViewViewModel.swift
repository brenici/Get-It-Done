//
//  NewItemViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

final class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueTime = Date()
    
    func createItem() {}
    
}

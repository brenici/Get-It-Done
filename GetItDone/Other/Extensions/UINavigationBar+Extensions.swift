//
//  UINavigationBar+Extensions.swift
//  Get It Done
//
//  Created by Emilian Brenici on 10/06/2023.
//

import UIKit

extension UINavigationBar {
    
    func restoreDefaultAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        self.standardAppearance = appearance
    }
    
    func setClearAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundEffect = nil
        appearance.backgroundColor = .clear
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        self.standardAppearance = appearance
    }

}

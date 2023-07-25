//
//  hideKeyboard.swift
//  PostCode
//
//  Created by mahmut kara on 25.07.2023.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        DispatchQueue.main.async {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

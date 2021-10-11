//
//  ExtensionOfView.swift
//  Task01
//
//  Created by Fardan Akhter on 10/11/21.
//

import Foundation
import SwiftUI

extension View {
    func addSwipeActions(leadingButtons: [SwipeButtons],
                          trailingButton: [SwipeButtons],
                          action: @escaping (SwipeButtons) -> Void) -> some View {
        self.modifier(SwipeButtonContainer(leadingButtons: leadingButtons, trailingButton: trailingButton, action: action))
    }
}

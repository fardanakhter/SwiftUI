//
//  HoverButton.swift
//  Task02
//
//  Created by Fardan Akhter on 10/11/21.
//

import Foundation
import SwiftUI

//MARK:- HoverButton
struct HoverButton<Label>: View where Label: View {
    
    //Properties
    private let action: () -> ()
    private let label: () -> Label
    
    //Observing Property
    @Binding var pressed: Bool
    
    //Constructor
    init(isPressed: Binding<Bool> ,action: @escaping () -> (), label: @escaping () -> Label) {
        self.action = action
        self.label = label
        self._pressed = isPressed
    }
    
    var body: some View {
        Button(action: action) {
            label()
                .foregroundColor(.white)
                .frame(width: 100, height: 50, alignment: .center)
        }
        .gesture(DragGesture(minimumDistance: 0.0)
                    .onChanged { _ in
                        let _ = self.background(Color.red)
                        self.pressed = true
                        self.action()
                    }
                    .onEnded { _ in
                        let _ = self.background(Color.blue)
                        self.pressed = false
                        self.action()
                    })
    }
}

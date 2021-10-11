//
//  ContentView.swift
//  Task01
//
//  Created by Fardan Akhter on 10/11/21.
//

/**
 Task 1
 ------
 1. Implement table row swipe actions similar to native iOS swipes ✅
 2. Pay attention to 'primary' and secondary action behaviour ✅
 3. Use different action types and handlers in different rows ✅
 4. Use Xcode iOS SwiftUI-app template with iOS 14.5 target. ✅
 */

import SwiftUI

let rows: [ListRowView] = [ListRowView(data: "Save Action Cell", leadingButtons: [.save]),
                           ListRowView(data: "Edit Action Cell", leadingButtons: [.edit]),
                           ListRowView(data: "Info Action Cell", leadingButtons: [.info]),
                           ListRowView(data: "Delete Action Cell", trailingButtons: [.delete])]

struct ContentView: View {
    var body: some View {
        List(rows){ item in
            item.addSwipeActions(leadingButtons: item.leadingButtons, trailingButton: item.trailingButtons) { (button) in
                
                switch button {
                case .save: print("Save")
                case .info: print("Info")
                case .delete: print("Delete")
                case .edit: print("Edit")
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

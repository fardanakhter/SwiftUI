//
//  ListRow.swift
//  Task01
//
//  Created by Fardan Akhter on 10/11/21.
//

import SwiftUI

let buttonWidth: CGFloat = 60

struct SwipableButton: View {
    
    let data: SwipeButtons
    let cellHeight: CGFloat
    let cellWidth: CGFloat
    
    init(data: SwipeButtons, cellHeight: CGFloat, cellWidth: CGFloat = buttonWidth){
        self.data = data
        self.cellHeight = cellHeight
        self.cellWidth = cellWidth
    }
    
    func getView(title: String) -> some View {
        VStack {
            Text(title)
        }.padding(.leading, 5)
        .foregroundColor(.primary)
        .font(.subheadline)
        .frame(width: cellWidth, height: cellHeight)
        //.frame(maxWidth: data == .delete ? .infinity : buttonWidth)
    }
    
    var body: some View {
        switch data {
        case .edit:
            getView(title: "Edit")
            .background(Color.pink)
        case .delete:
            getView(title: "Delete")
            .background(Color.red)
        case .save:
            getView(title: "Save")
            .background(Color.blue)
        case .info:
            getView(title: "Info")
            .background(Color.green)
        }
    }
}

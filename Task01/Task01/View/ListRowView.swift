//
//  ListRowView.swift
//  Task01
//
//  Created by Fardan Akhter on 10/11/21.
//

import SwiftUI

struct ListRowView: View, Identifiable{
    
    let data: String
    let leadingButtons: [SwipeButtons]
    let trailingButtons: [SwipeButtons]
    
    init(data: String, leadingButtons: [SwipeButtons] = [], trailingButtons: [SwipeButtons] = []) {
        self.data = data
        self.leadingButtons = leadingButtons
        self.trailingButtons = trailingButtons
    }
    
    var id: String{
        return "data: \(data), leading: \(leadingButtons.map{$0.id}), trailing: \(trailingButtons.map{$0.id})"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(data)
                Spacer()
            }
            .padding()
        }
    }
}



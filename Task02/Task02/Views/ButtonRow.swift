//
//  ButtonRow.swift
//  Task02
//
//  Created by Fardan Akhter on 10/11/21.
//

import AVFoundation
import SwiftUI

//MARK:- ButtonRow
struct ButtonRow: View {
    var player: PlayViewModel?
    
    @State private var isPressed = false
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 0) {
            
            Spacer()
            HoverButton(isPressed: $isPressed,
                        action:{
                            if $isPressed.wrappedValue {
                                player?.play()
                            }
                            else{
                                player?.stop()
                            }
                        }, label: {
                            Text("Hello World")
                        })
                .background($isPressed.wrappedValue ? Color.gray : Color.green)
            Spacer()
        }
        
    }
}

struct ButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRow(player: playerViews[0])
    }
}



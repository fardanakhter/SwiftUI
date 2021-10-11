//
//  ContentView.swift
//  Task01
//
//  Created by Fardan Akhter on 10/10/21.
//

import SwiftUI

/**
 Task 2
 ------
 1. Create a SwiftUI-app with single screen and “Hello World” Button. ✅
 2. Pressing and holding the button should play a sound file (see attachment). ✅
 3. When you release the button, playback should stop immediately. ✅
 4. The button should retain its standard iOS behaviour (color change on hold, etc.). ✅
 5. Pay attention to audio playback performance. ✅
 6. Use SwiftUI only. ✅
 7. Bonus part: place this button in List without breaking the specified behaviour. ✅
 */

let playerViews: [PlayViewModel] =
    [PlayViewModel(audioName: Constants.Audio.file01.fileName,
                   fileType: Constants.Audio.file01.fileExtension)]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(playerViews){ playerView in
                ButtonRow(player: playerView)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

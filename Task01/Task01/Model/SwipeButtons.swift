//
//  SwipeButtons.swift
//  Task01
//
//  Created by Fardan Akhter on 10/11/21.
//

import Foundation
import SwiftUI

enum SwipeButtons: Identifiable {
    case edit
    case delete
    case save
    case info
    
    var id: String {
        return "\(self)"
    }
}


//
//  Constants.swift
//  Task02
//
//  Created by Fardan Akhter on 10/11/21.
//

import Foundation

struct Constants {
    
    enum Audio: String {
        case file01 = "dtmf_1.mp3"
        
        var fileName: String {
            switch self{
            case .file01: return String(self.rawValue.split(separator: ".").first ?? "")
            }
        }
        
        var fileExtension: String {
            switch self{
            case .file01: return String(self.rawValue.split(separator: ".").last ?? "mp3")
            }
        }
    }
}

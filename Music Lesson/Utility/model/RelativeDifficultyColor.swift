//
//  RelativeDifficultyColor.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.04.22.
//

import Foundation
import SwiftUI

class RelativeDifficultyColor {
    
    static func getColor(_ difficulty: Double) -> Color {
        switch difficulty {
        case -0.2:
            return Color.gray
        case -0.1:
            return Color.gray
        case 0:
            return Color.gray
        case 0.1:
            return Color.gray
        case 0.2:
            return Color.gray
        default:
            return Color.gray
        }
    }
}

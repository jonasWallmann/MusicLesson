//
//  PlayObjectVM.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 26.02.22.
//

import Foundation
import SwiftUI

class PlayObjectModel: Identifiable {
    
    let heightFactor: Int = 3
    
    let play: PlayEntity
    
    var heightBefore: CGFloat = 50
    var height: CGFloat = 50
    var color: Color = Color.green
    
    init(_ play: PlayEntity, dateBefore: Date?, foreward: Bool) {
        self.play = play
        
        let daysBefore: Int = DateUtility.daysBetween(dateBefore ?? getBorderDate(foreward), play.startDate!)
        let heightBeforeInt: Int = daysBefore * heightFactor
        self.heightBefore = CGFloat(heightBeforeInt)
        
        let daysPlayed: Int = DateUtility.daysBetween(play.startDate!, play.endDate ?? Date())
        let heightInt: Int = daysPlayed * heightFactor
        self.height = CGFloat(heightInt)
        
        self.color = getColor(play.actualDifficulty)
    }
    
    private func getBorderDate(_ foreward: Bool) -> Date {
        let year: Int = DateUtility.getYear(play.startDate!)
        if(foreward) {
            return DateUtility.makeDate(year: year, month: 1, day: 1)
        }
        return DateUtility.makeDate(year: year, month: 12, day: 30)
    }
    
    private func getColor(_ difficulty: Double) -> Color {
        return Color.blue
    }
}

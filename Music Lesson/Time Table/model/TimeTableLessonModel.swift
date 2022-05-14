//
//  TimeTableLessonVM.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 23.02.22.
//

import Foundation
import SwiftUI

class TimeTableLessonModel: Identifiable {
    
    let lesson: LessonEntity
    let firstName: String
    let lastName: String
    
    var minuteSpaceBefore: CGFloat = 0
    var minuteSpace: CGFloat = 0
    
//    let height: CGFloat = UIScreen.main.bounds.size.height * 0.9
//    let displayMinutes: CGFloat = 480
//    let heightPerMinute: CGFloat = height / displayMinutes
    
    let heightPerMinute: CGFloat = UIScreen.main.bounds.size.height * 0.001875
    
    init(lesson: LessonEntity) {
        self.lesson = lesson
        self.firstName = lesson.student!.firstName!
        self.lastName = lesson.student!.lastName!
    }
    
    func calcSpace(fromTime: Date) {
        let minutesBefore: CGFloat = CGFloat(DateUtility.minuetesBetween(fromTime, lesson.startTime!))
        let minutes: CGFloat = CGFloat(DateUtility.minuetesBetween(lesson.startTime!, lesson.endTime!))
        
        minuteSpaceBefore = minutesBefore * heightPerMinute
        minuteSpace = minutes * heightPerMinute
    }
}

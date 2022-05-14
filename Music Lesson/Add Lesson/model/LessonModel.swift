//
//  LessonModel.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.04.22.
//

import Foundation

class LessonModel {
    @Published var weekDayNr: Int16?
    @Published var startTime: Date = Date() {
        didSet { endTime = DateUtility.addTime(toDate: startTime, min: 30) }
    }
    @Published var endTime: Date = Date()
}

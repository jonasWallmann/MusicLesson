//
//  TimeTableDayVM.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 23.02.22.
//

import Foundation

class TimeTableDayModel: Identifiable {
    
    var lessonList: [TimeTableLessonModel] = []
    
    init() {}
    
    // MARK: manage ------------------------------------------
    
    func addLesson(_ lesson: LessonEntity) {
        lessonList.append(TimeTableLessonModel(lesson: lesson))
    }
    
    func adjust(_ earliestTime: Date) {
        var fromTime: Date = earliestTime
        for lesson in lessonList {
            lesson.calcSpace(fromTime: fromTime)
            fromTime = lesson.lesson.endTime!
        }
    }
    
    // MARK: get times ------------------------------------------
    
    func getEarlyTime() -> Date? {
        if(!lessonList.isEmpty) {
            return lessonList[0].lesson.startTime
        }
        return nil
    }
    
    func getLateTime() -> Date? {
        if(!lessonList.isEmpty) {
            return lessonList[lessonList.count-1].lesson.startTime
        }
        return nil
    }
}




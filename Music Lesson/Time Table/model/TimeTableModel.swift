//
//  TimeTableModel.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 02.04.22.
//

import Foundation

class TimeTableModel {
    
    var dayList: [TimeTableDayModel] = []
    var timeList: [Date] = []
    
    private var earliestTime: Date = DateUtility.makeDate(hr: 23, min: 59)
    private var latestTime: Date = DateUtility.makeDate()
    
    init(lessonList: [LessonEntity]) {
        createTimetable(lessonList.sorted(by: {$0.startTime! < $1.startTime!}))
    }
    
    private func createTimetable(_ sortedLessonList: [LessonEntity]) {
        // fill
        createDays()
        addLessons(sortedLessonList)
        // time
        calcTimespan()
        calcTimeList()
        // view
        adjustTimes()
    }
    
    
    // MARK: fill --------------------------------------------------
    
    private func createDays() {
        for _ in Range(0...4) {
            dayList.append(TimeTableDayModel())
        }
    }
    
    private func addLessons(_ lessonList: [LessonEntity]) {
        for lesson in lessonList {
            let dayNr: Int = Int(lesson.weekdayNr)
            dayList[dayNr].addLesson(lesson)
        }
    }
    
    // MARK: time ----------------------------------------------------
    
    private func calcTimespan() {
        for d in Range(0...4) {
            // early
            if let earlyTime = dayList[d].getEarlyTime() {
                if(earlyTime < earliestTime) {
                    earliestTime = earlyTime
                }
            }
            // late
            if let lateTime = dayList[d].getLateTime() {
                if(lateTime < latestTime) {
                    latestTime = lateTime
                }
            }
        }
    }
    
    private func calcTimeList() {
        var time: Date = earliestTime
        let minuteComponent: Int = Calendar(identifier: .gregorian).component(.minute, from: time)
        
        if minuteComponent != 30 {
            time = DateUtility.addTime(toDate: time, min: -minuteComponent)
        }
        
        while time <= DateUtility.addTime(toDate: latestTime, min: 29) {
            timeList.append(time)
            time = DateUtility.addTime(toDate: time, min: 30)
        }
    }
    
    
    // MARK: view -----------------------------------------------------
    
    private func adjustTimes() {
        for d in Range(0...4) {
            dayList[d].adjust(earliestTime)
        }
    }
}

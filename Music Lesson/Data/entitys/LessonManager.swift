//
//  StudentManager.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 23.02.22.
//

import Foundation
import CoreData

class LessonManager {
    
    let db = CoreDataManager.instance.context
    
    var lessonList: [LessonEntity] = []
    
    init() {
        fetchLessonList()
    }
    
    private func fetchLessonList() {
        let request = NSFetchRequest<LessonEntity>(entityName: "LessonEntity")
        do {
            lessonList = try db.fetch(request)
        } catch let error {
            print("!!!Error fetching person list!!! \(error.localizedDescription)")
        }
    }
    
    func addLesson(model: LessonModel, student: StudentEntity) {
        let newLesson: LessonEntity = LessonEntity(context: db)
        newLesson.weekdayNr = model.weekDayNr!
        newLesson.startTime = DateUtility.onlyTime(fromDate: model.startTime)
        newLesson.endTime = DateUtility.onlyTime(fromDate: model.endTime)
        newLesson.student = student
        save()
    }
    
    private func save() {
        do {
            try self.db.save()
        } catch let error {
            print("!!!Error saving Core Data!!! \(error.localizedDescription)")
        }
        lessonList = []
        self.fetchLessonList()
    }
    
    func delete(_ lesson: LessonEntity) {
        db.delete(lesson)
        save()
    }
}

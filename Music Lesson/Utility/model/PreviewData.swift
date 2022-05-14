//
//  PreviewData.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 04.03.22.
//

import Foundation

struct PreviewData {
    
    let db = CoreDataManager.instance.context
    
    var studentList: [StudentEntity] = []
    var lessonList: [LessonEntity] = []
    var pieceList: [PieceEntity] = []
    var playList: [PlayEntity] = []
    
    var testList: [String] = []
    
    init() {
        testList.append(contentsOf: ["Niels", "Joel"])
//        createStudents()
//        fillPieceList()
//        fillPlayList()
    }
    
    private mutating func createStudents() {
        addStudent(firstName: "Niels", lastName: "Freitag", weekDayNr: 2, sHr: 12, sMin: 30, eHr: 13, eMin: 0)
        addStudent(firstName: "Joel", lastName: "Rose", weekDayNr: 4, sHr: 11, sMin: 0, eHr: 11, eMin: 30)
    }
    
    private mutating func addStudent(firstName: String, lastName: String, weekDayNr: Int16, sHr: Int, sMin: Int, eHr: Int, eMin: Int) {
        let newStudent: StudentEntity = StudentEntity()
        newStudent.firstName = firstName
        newStudent.lastName = lastName
        
        let newLesson: LessonEntity = LessonEntity()
        newLesson.weekdayNr = weekDayNr
        newLesson.startTime = DateUtility.makeDate(hr: sHr, min: sMin)
        newLesson.endTime = DateUtility.makeDate(hr: eHr, min: eMin)
        
        newLesson.student = newStudent
        newStudent.lesson = newLesson
        
        studentList.append(newStudent)
        lessonList.append(newLesson)
        testList.append(firstName)
    }
    
    private func fillPieceList() {
        
    }
    
    private func fillPlayList() {
        
    }
}

//
//  AddStudentVM.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.03.22.
//

import Foundation
import SwiftUI

class AddLessonVM: ObservableObject {
    
    @Published var studentModel: StudentModel = StudentModel()
    @Published var lessonModel: LessonModel = LessonModel()
    
    let em: EntityManager
    
    init(em: EntityManager) {
        self.em = em
    }
    
    func add() {
        let newStudentEntity = em.studentManager.addStudent(model: studentModel)
        if(lessonModel.weekDayNr != nil) {
            em.lessonManager.addLesson(model: lessonModel, student: newStudentEntity)
        }
    }
    
    func goBackAfterSafe() -> Bool {
        return em.playManager.playList.count > 0
    }
}

//
//  TimetableVM.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 23.02.22.
//

import Foundation

class TimeTableVM: ObservableObject {
    
    @Published var em: EntityManager
    @Published var model: TimeTableModel
    
    @Published var addLessonVM: AddLessonVM

    // MARK: init ---------------------------------------------------
    
    init(em: EntityManager) {
        self.em = em
        self.model = TimeTableModel(lessonList: em.lessonManager.lessonList)
        
        self.addLessonVM = AddLessonVM(em: em)
    }
    
    func addLesson() {
        addLessonVM.add()
        model = TimeTableModel(lessonList: em.lessonManager.lessonList)
    }
}

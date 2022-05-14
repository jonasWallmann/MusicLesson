//
//  ViewModel.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 02.04.22.
//

import Foundation

class EntityManager: ObservableObject {
    
    let studentManager: StudentManager = StudentManager()
    let lessonManager: LessonManager = LessonManager()
    let playManager: PlayManager = PlayManager()
    let pieceManager: PieceManager = PieceManager()
    
    @Published var student: StudentEntity?
}

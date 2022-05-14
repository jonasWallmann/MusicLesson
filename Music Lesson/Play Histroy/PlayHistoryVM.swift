//
//  PlayHistoryVM.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 24.02.22.
//

import Foundation

class PlayHistoryVM: ObservableObject {
    
    @Published var em: EntityManager {
        didSet {
            fillPlayList()
            print("em changed")
        }
    }
    
    @Published var foreward: Bool {
        didSet { fillPlayList() }
    }
    
    @Published var playYearList: [PlayYearModel] = []
    
    // MARK: init ---------------------------------------------
    
    init(em: EntityManager, foreward: Bool = true) {
        self.em = em
        self.foreward = foreward
        fillPlayList()
    }
    
    private func fillPlayList() {
        if(em.student != nil) {
            self.playYearList = PlayModel(student: em.student, foreward: foreward).playYearList
        }
    }
}

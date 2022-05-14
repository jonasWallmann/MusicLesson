//
//  PlayManager.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 24.02.22.
//

import Foundation
import CoreData


class PlayManager {
    
    let db = CoreDataManager.instance.context
    
    var playList: [PlayEntity] = []
    
    init() {
        fetchPlayList()
    }
    
    private func fetchPlayList() {
        let request = NSFetchRequest<PlayEntity>(entityName: "PlayEntity")
        do {
            playList = try db.fetch(request)
        } catch let error {
            print("!!!Error fetching person list!!! \(error.localizedDescription)")
        }
    }
    
    func addPlay(student: StudentEntity, piece: PieceEntity, expectedDifficulty: Double) {
        let newPlay: PlayEntity = PlayEntity(context: db)
        
        newPlay.student = student
        newPlay.piece = piece
        newPlay.expectedDifficulty = expectedDifficulty
        newPlay.startDate = Date()
        
        save()
    }
    
    private func save() {
        do {
            try self.db.save()
        } catch let error {
            print("!!!Error saving Core Data!!! \(error.localizedDescription)")
        }
        playList = []
        self.fetchPlayList()
    }
    
    func delete(_ play: PlayEntity) {
        db.delete(play)
        save()
    }
}

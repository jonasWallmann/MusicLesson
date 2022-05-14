//
//  PlayManager.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 24.02.22.
//

import Foundation
import CoreData


class PieceManager {
    
    let db = CoreDataManager.instance.context
    
    var pieceList: [PieceEntity] = []
    
    init() {
        fetchPieceList()
    }
    
    private func fetchPieceList() {
        let request = NSFetchRequest<PieceEntity>(entityName: "PieceEntity")
        do {
            pieceList = try db.fetch(request)
        } catch let error {
            print("!!!Error fetching person list!!! \(error.localizedDescription)")
        }
    }
    
    func addPiece(model: PieceModel) -> PieceEntity {
        let newPiece: PieceEntity = PieceEntity(context: db)
        
        newPiece.title = model.title
        newPiece.composer = model.composer
        newPiece.instrument = model.instrument
        newPiece.difficulty = model.difficulty
        
        save()
        return newPiece
    }
    
    func getPieces(instrument: String) -> [PieceEntity] {
        var list: [PieceEntity] = []
        for piece in pieceList {
            if(piece.instrument! == instrument) {
                list.append(piece)
            }
        }
        return list
    }
    
    private func save() {
        do {
            try self.db.save()
        } catch let error {
            print("!!!Error saving Core Data!!! \(error.localizedDescription)")
        }
        pieceList = []
        self.fetchPieceList()
    }
    
    func delete(_ piece: PieceEntity) {
        db.delete(piece)
        save()
    }
}

//
//  DifficultySuggestionVM.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.03.22.
//

import Foundation


class SuggestionModel: Identifiable {
    
    let difficulty: Double
    var suggestedPieceList: [PieceEntity] = []
    
    init(_ difficulty: Double, pieceList: [PieceEntity], count: Int) {
        self.difficulty = difficulty
        let possiblePieceList: [PieceEntity] = getPossiblePieces(pieceList)
        fillSuggestions(count, possiblePieceList)
    }
    
    private func fillSuggestions(_ suggestionCount: Int, _ possiblePieceList: [PieceEntity]) {
        if(possiblePieceList.isEmpty) {
            return
        }
        for _ in 1...suggestionCount {
            let randomIndex: Int = Int.random(in: 0..<possiblePieceList.count)
            let suggestion: PieceEntity = possiblePieceList[randomIndex]
            suggestedPieceList.append(suggestion)
        }
    }
    
    private func getPossiblePieces(_ pieceList: [PieceEntity]) -> [PieceEntity] {
        var list: [PieceEntity] = []
        for piece in pieceList {
            if rightDifficulty(piece) {
                list.append(piece)
            }
        }
        return list
    }
    
    private func rightDifficulty(_ piece: PieceEntity) -> Bool {
        let left: Bool = piece.difficulty > difficulty - 0.5
        let right: Bool = piece.difficulty < difficulty + 0.5
        return left && right
    }
}

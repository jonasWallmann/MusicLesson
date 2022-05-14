//
//  NextPieceVM.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.04.22.
//

import Foundation

class NextPieceVM: ObservableObject {
    
    @Published var em: EntityManager
    @Published var pieceModel: PieceModel
    
    @Published var suggestionList: [SuggestionModel] = []
    
    init(em: EntityManager) {
        self.em = em
        self.pieceModel = PieceModel()
        if(em.student != nil) {
            let skill: Double = SkillCalculator(em.student!).skill
            fillSugesstionList(skill: skill, piceList: em.pieceManager.pieceList)
        }
    }
    
    func addPiece() {
        let piece: PieceEntity = em.pieceManager.addPiece(model: pieceModel)
        if(em.student != nil) {
            em.playManager.addPlay(student: em.student!, piece: piece, expectedDifficulty: 0.5)
        }
        pieceModel.reset()
    }
    
    private func fillSugesstionList(skill: Double, piceList: [PieceEntity]) {
        let steps: Double = 0.05
        let lowerBorder: Double = skill - steps * 2
        let upperBorder: Double = skill + steps * 2
        
        for difficulty in stride(from: lowerBorder, to: upperBorder, by: steps) {
            let pieceCount: Int = 3 - Int(abs(skill - difficulty) * (1 / steps)) // 1, 2, 3, 2, 1
            let suggestion: SuggestionModel = SuggestionModel(difficulty, pieceList: piceList, count: pieceCount)
            suggestionList.append(suggestion)
        }
    }
}

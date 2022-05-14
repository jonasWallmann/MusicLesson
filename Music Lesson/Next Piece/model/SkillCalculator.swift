//
//  SkillCalculator.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 26.02.22.
//

import Foundation

class SkillCalculator {
    
    private var numberPlays: Int = 0
    var skill: Double = 0
    
    init(_ student: StudentEntity) {
        let playList: [PlayEntity] = student.playList!.array as! [PlayEntity]
        let lastFewPlays: [PlayEntity] = lastFew(fromList: playList)
        skill = calcSkill(lastFewPlays)
    }
    
    private func calcSkill(_ playList: [PlayEntity]) -> Double {
        if(numberPlays == 0) {
            return 0.1
        }
        var addedSkill: Double = 0
        for play in playList {
            let difference: Double = play.piece!.difficulty - play.actualDifficulty
            addedSkill += play.piece!.difficulty + difference
        }
        return addedSkill / Double(numberPlays)
    }
    
    private func lastFew(fromList: [PlayEntity]) -> [PlayEntity] {
        var list: [PlayEntity] = []
        for play in fromList {
            list.append(play)
            numberPlays += 1
            if(numberPlays == 3) { break }
        }
        return list
    }
}

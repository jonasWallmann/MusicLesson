//
//  PlayModel.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.04.22.
//

import Foundation

class PlayModel {
    
    var playYearList: [PlayYearModel] = []

    init(student: StudentEntity?, foreward: Bool = true) {
        if(student == nil) {
            return
        }
        let playEntityList: [PlayEntity] = student!.playList!.array as! [PlayEntity]
        let sortedList: [PlayEntity] = getSortedList(playEntityList, foreward: foreward)
        fillPlayYearList(sortedList, foreward: foreward)
    }
    
    private func getSortedList(_ playEntityList: [PlayEntity], foreward: Bool) -> [PlayEntity] {
        if(foreward) {
            return playEntityList.sorted(by: {$0.startDate! < $1.startDate!})
        }
        return playEntityList.sorted(by: {$0.startDate! > $1.startDate!})
    }
    
    private func fillPlayYearList(_ playEntityList: [PlayEntity], foreward: Bool) {
        playYearList.append(PlayYearModel(year: getYear(playEntityList.first)))
        for play in playEntityList {
            adjustYear(play)
            playYearList.last!.addPlay(play, foreward: foreward)
        }
    }
    
    private func adjustYear(_ play: PlayEntity) {
        if(getYear(play) != playYearList.last!.year) {
            playYearList.append(PlayYearModel(year: getYear(play)))
        }
    }
    
    private func getYear(_ play: PlayEntity?) -> Int {
        if(play != nil) {
            return DateUtility.getYear(play!.startDate!)
        }
        return DateUtility.getYear(Date())
    }
    
}

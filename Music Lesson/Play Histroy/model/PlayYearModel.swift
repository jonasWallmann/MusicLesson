//
//  PlayYearVM.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 02.03.22.
//

import Foundation

class PlayYearModel: Identifiable {
    
    let year: Int
    var playList: [PlayObjectModel] = []
    
    init(year: Int) {
        self.year = year
    }
    
    func addPlay(_ play: PlayEntity, foreward: Bool) {
        playList.append(PlayObjectModel(play, dateBefore: playList.last?.play.endDate, foreward: foreward))
    }
}


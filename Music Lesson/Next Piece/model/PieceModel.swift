//
//  PieceModel.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.04.22.
//

import Foundation

class PieceModel {
    
    @Published var title: String = ""
    @Published var composer: String = ""
    @Published var instrument: String = ""
    @Published var difficulty: Double = 0.5
    
    func reset() {
        title = ""
        composer = ""
        instrument = ""
        difficulty = 0.5
    }
}

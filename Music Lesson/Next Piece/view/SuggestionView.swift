//
//  PlayDifficultySuggestion.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.04.22.
//

import SwiftUI

struct SuggestionView: View {
    
    let suggestion: SuggestionModel
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 40)
                .foregroundColor(RelativeDifficultyColor.getColor(suggestion.difficulty))
            VStack {
                ForEach(suggestion.suggestedPieceList) { piece in
                    Text(piece.title!)
                }
            }
        }
        .cornerRadius(8)
    }
}

struct PlayDifficultySuggestion_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView(suggestion: SuggestionModel(0.5, pieceList: PieceManager().pieceList, count: 3))
    }
}

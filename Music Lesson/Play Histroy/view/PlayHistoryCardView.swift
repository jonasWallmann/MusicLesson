//
//  PlayHistoryCardView.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.04.22.
//

import SwiftUI

struct PlayHistoryCardView: View {
    
    let playM: PlayObjectModel
    
    var body: some View {
        VStack {
            Spacer().frame(height: playM.heightBefore)
            HStack {
                Rectangle()
                    .frame(width: 10)
                    .foregroundColor(playM.color)
                Text(playM.play.piece!.title!)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 200, height: playM.height)
            .shadow(color: Color.gray.opacity(0.6), radius: 2, x: 1, y: 1)
        }
    }
}

struct PlayHistoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlayHistoryCardView(playM: PlayObjectModel(PlayManager().playList.first!, dateBefore: Date(), foreward: true))
    }
}

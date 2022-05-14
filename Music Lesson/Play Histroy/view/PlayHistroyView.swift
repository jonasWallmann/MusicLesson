//
//  PlayHistroyView.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 24.02.22.
//

import SwiftUI

struct PlayHistroyView: View {
    
    @StateObject var vm: PlayHistoryVM
    
    var body: some View {
        HStack {
            SelectStudentView(vm: SelectStudentVM(em: vm.em))
            ForEach(vm.playYearList) { year in
                PlayYearView(year: year)
            }
            Spacer()
        }
    }
}

struct PlayYearView: View {
    
    let year: PlayYearModel
    
    var body: some View {
        VStack {
            Text(String(year.year))
                .font(.title)
            ForEach(year.playList) { playM in
                PlayHistoryCardView(playM: playM)
            }
        }
    }
}

struct PlayHistroyView_Previews: PreviewProvider {
    static var previews: some View {
        PlayHistroyView(vm: PlayHistoryVM(em: EntityManager()))
    }
}

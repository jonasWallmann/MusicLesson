//
//  NextPieceView.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.03.22.
//

import SwiftUI

struct NextPieceView: View {
    
    @StateObject var vm: NextPieceVM
    
    var body: some View {
        HStack {
            SelectStudentView(vm: SelectStudentVM(em: vm.em))
            AddPieceView(vm: vm)
            ForEach(vm.suggestionList) { suggestion in
                SuggestionView(suggestion: suggestion)
            }
        }
    }
}

struct NextPieceView_Previews: PreviewProvider {
    static var previews: some View {
        NextPieceView(vm: NextPieceVM(em: EntityManager()))
    }
}

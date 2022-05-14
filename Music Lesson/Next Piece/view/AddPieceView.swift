//
//  AddPieceView.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.04.22.
//

import SwiftUI

struct AddPieceView: View {
    
    @StateObject var vm: NextPieceVM
    
    var body: some View {
        VStack(alignment: .leading) {
            TextInputView(label: "title", input: $vm.pieceModel.title, length: 150, space: 63)
            TextInputView(label: "composer", input: $vm.pieceModel.composer, length: 150, space: 17)
            TextInputView(label: "instrument", input: $vm.pieceModel.instrument, length: 150, space: 10)
            HStack {
                Slider(value: $vm.pieceModel.difficulty, in: 0...1, step: 0.01)
                    .frame(width: 210)
                Text("\(vm.pieceModel.difficulty * 100, specifier: "%.0f")")
            }
            Button {
                vm.addPiece()
            } label: {
                Text("add piece")
            }
            .buttonModifier()
        }
    }
}

struct AddPieceView_Previews: PreviewProvider {
    static var previews: some View {
        AddPieceView(vm: NextPieceVM(em: EntityManager()))
    }
}

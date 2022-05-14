//
//  TextImputView.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.03.22.
//

import SwiftUI

struct TextInputView: View {
    
    var label: String = ""
    @Binding var input: String
    
    var example: String = ""
    
    var length: CGFloat = 140
    var space: CGFloat = 7
    
    var body: some View {
        HStack {
            Text(label)
                .font(.callout)
                .bold()
            
            Spacer().frame(maxWidth: space)

            TextField(example, text: $input)
                .frame(maxWidth: length)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.vertical, 3)
    }
}


struct TextImputView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView(label: "name", input: .constant("name"))
    }
}

//
//  ChooseTimeView.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.03.22.
//

import SwiftUI

struct ChooseTimeView: View {
    
    let type: String
    @Binding var time: Date
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("\(type) time")
                    .bold()
            
                DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .frame(width: 70)
            }

            DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                .datePickerStyle(GraphicalDatePickerStyle())
                .scaleEffect(0.45)
                .frame(width: 60, height: 60)
        }
    }
    
}


struct ChooseTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTimeView(type: "start", time: .constant(Date()))
    }
}

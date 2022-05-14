//
//  ChooseDayView.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.03.22.
//

import SwiftUI


struct ChooseDayView: View {
    
    @Binding var weekDayNr: Int16?
    let weekDays: [String] = DateUtility.weekdays
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(0..<weekDays.count) { nr in
                Button {
                    if(weekDayNr != nil && weekDayNr! == Int(nr)) {
                        weekDayNr = nil
                    } else {
                        weekDayNr = Int16(nr)
                    }
                } label: {
                    Text(weekDays[nr])
                        .buttonPadding()
                        .font(.title2)
                        .background(weekDayNr == Int16(nr) ? Color.blue : Color.gray)
                        .foregroundColor(Color.white)
                        .clipShape(Capsule())
                }
            }
        }
    }
}


struct ChooseDayView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseDayView(weekDayNr: .constant(2))
    }
}

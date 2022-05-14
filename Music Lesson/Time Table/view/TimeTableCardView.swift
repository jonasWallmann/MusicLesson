//
//  TimeTableCardView.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 23.02.22.
//

import SwiftUI

struct TimeTableCardView: View {
    let lessonM: TimeTableLessonModel
    
    var body: some View {
        VStack {
            Spacer().frame(height: lessonM.minuteSpaceBefore)
            HStack(spacing: 0) {
                Rectangle()
                    .frame(width: 10)
                    .foregroundColor(Color.blue)
                Text(lessonM.firstName)
                    .font(.title2)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue.opacity(0.8))
                    .foregroundColor(Color.white)
            }
            .frame(width: 130, height: lessonM.minuteSpace)
            .cornerRadius(10)
        }
    }
}

struct TimeTableCardView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableCardView(lessonM: TimeTableLessonModel(lesson: LessonManager().lessonList.first!))
    }
}

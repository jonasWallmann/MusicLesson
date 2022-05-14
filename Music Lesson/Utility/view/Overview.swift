//
//  Overview.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 04.03.22.
//

import SwiftUI

struct Overview: View {
    
    let studentList: [StudentEntity] = StudentManager().studentList
    let lessonList: [LessonEntity] = LessonManager().lessonList
    let pieceList: [PieceEntity] = PieceManager().pieceList
    let playList: [PlayEntity] = PlayManager().playList
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack(spacing: 30) {
                // students
                HStack {
                    Text("students")
                        .frame(width: 100, alignment: .leading)
                    ForEach(studentList) { student in
                        Text(student.firstName!)
                    }
                }
                // lessons
                HStack {
                    Text("lessons")
                        .frame(width: 100, alignment: .leading)
                    ForEach(lessonList) { lesson in
                        VStack {
                            Text(lesson.student!.firstName!)
                            Text(String(lesson.weekdayNr))
                        }
                    }
                }
                // pieces
                HStack {
                    Text("pieces")
                        .frame(width: 100, alignment: .leading)
                    ForEach(pieceList) { piece in
                        Text(piece.title!)
                    }
                }
                // plays
                HStack {
                    Text("plays")
                        .frame(width: 100, alignment: .leading)
                    ForEach(playList) { play in
                        VStack {
                            Text(play.student!.firstName!)
                            Text(play.piece!.title!)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview()
    }
}

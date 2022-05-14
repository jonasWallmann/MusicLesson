//
//  Music_LessonApp.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 23.02.22.
//

import SwiftUI

@main
struct Music_LessonApp: App {
    
    @StateObject var em: EntityManager = EntityManager()
    
    var body: some Scene {
        WindowGroup {
//            Button("reset") { reset() }
            TabView {
                TimeTableView(vm: TimeTableVM(em: em))
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Timetable")
                    }
                PlayHistroyView(vm: PlayHistoryVM(em: em))
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle")
                        Text("History")
                    }
                NextPieceView(vm: NextPieceVM(em: em))
                    .tabItem {
                        Image(systemName: "play")
                        Text("Play")
                    }
                StatisticsView()
                    .tabItem {
                        Image(systemName: "number")
                        Text("Statistics")
                    }
//                Overview()
//                    .tabItem {
//                        Image(systemName: "eye")
//                        Text("Overview")
//                    }
            }
        }
    }
    
    private func reset() {
        for student in em.studentManager.studentList {
            em.studentManager.delete(student)
        }
        for lesson in em.lessonManager.lessonList {
            em.lessonManager.delete(lesson)
        }
        for play in em.playManager.playList {
            em.playManager.delete(play)
        }
    }
}

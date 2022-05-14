//
//  TimeTableView.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 23.02.22.
//

import SwiftUI

struct TimeTableView: View {
    
    @StateObject var vm: TimeTableVM
    
    var body: some View {
        NavigationView {
            VStack {
                DaysView()
                    .padding(.top)
                ZStack {
                    ScrollView(showsIndicators: true) {
                        TimesView(timeList: vm.model.timeList)
                        CardsView(dayList: vm.model.dayList)
                    }
                }
            }
            .navigationTitle("Timetable")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddLessonView(vm: vm)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .environmentObject(vm)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


// MARK: days ----------------------------------------------------------

private struct DaysView: View {
    var body: some View {
        HStack {
            ForEach(DateUtility.weekdays, id: \.self) { day in
                Text(day)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .frame(width: 150)
            }
        }
        .padding(.top)
    }
}


// MARK: times ----------------------------------------------------------

private struct TimesView: View {
    
    let timeList: [Date]
    
    var body: some View {
        VStack {
            ForEach(timeList, id: \.self) { time in
                HStack {
                    Text(DateUtility.string(fromDate: time))
                    Divider()
                }
            }
        }
    }
}


// MARK: cards -----------------------------------------------------------

private struct CardsView: View {
    
    let dayList: [TimeTableDayModel]
    
    var body: some View {
        HStack(alignment: .top) {
            ForEach(dayList) { day in
                DayLessonCards(day: day)
            }
        }
    }
}


private struct DayLessonCards: View {
    
    let day: TimeTableDayModel
    
    @State var clickedCard: Bool = false
    @EnvironmentObject var vm: TimeTableVM
    
    var body: some View {
        VStack {
            ForEach(day.lessonList) { lessonM in
                TimeTableCardView(lessonM: lessonM)
            }
        }
        .frame(width: 130)
    }
}


// MARK: preview --------------------------------------------------------

struct TimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableView(vm: TimeTableVM(em: EntityManager()))
            .previewInterfaceOrientation(.portrait)
    }
}

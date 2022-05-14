//
//  AddStudentView.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.03.22.
//

import SwiftUI

struct AddLessonView: View {
    
    @StateObject var vm: TimeTableVM
    @Environment(\.presentationMode) var presentationMode
    
    var student: Binding<StudentModel> {
        return $vm.addLessonVM.studentModel
    }
    var lesson: Binding<LessonModel> {
        return $vm.addLessonVM.lessonModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            basic
            day
            time
            addButton
        }
        .navigationTitle("New Student")
    }
    
    // 1 ----------------------------------------------
    var basic: some View {
        VStack {
            TextInputView(label: "first name", input: student.firstName)
            TextInputView(label: "last name", input: student.lastName)
            TextInputView(label: "instrument", input: student.instrument)
        }
        .font(.headline)
    }
    
    // 2 ----------------------------------------------
    var day: some View {
        ChooseDayView(weekDayNr: lesson.weekDayNr)
    }
    
    // 3 ----------------------------------------------
    var time: some View {
        HStack {
            ChooseTimeView(type: "start", time: lesson.startTime)
            ChooseTimeView(type: "end", time: lesson.endTime)
        }
    }
    
    // 4 ----------------------------------------------
    var addButton: some View {
        Button {
            vm.addLesson()
            if(vm.addLessonVM.goBackAfterSafe()) {
                presentationMode.wrappedValue.dismiss()
            }
        } label: {
            Text("add student")
                .buttonPadding()
                .font(.title)
                .background(Color.accentColor)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }

    }
}


struct AddStudentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("hello")
    }
}

//
//  SelectStudentView.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 04.04.22.
//

import SwiftUI

struct SelectStudentView: View {

    @StateObject var vm: SelectStudentVM
    
    var body: some View {
        HStack(spacing: 0) {
            Divider()
            StudentListView(vm: vm)
            Divider()
        }
        .padding(.top)
        .frame(width: 200)
    }
}

private struct StudentListView: View {
    
    @ObservedObject var vm: SelectStudentVM
    
    var body: some View {
        List(vm.list) { student in
            StudentSelectionView(selectedStudent: $vm.em.student, student: student)
        }
        .listStyle(PlainListStyle())
    }
}

private struct StudentGroupedListView: View {
    
    @ObservedObject var vm: SelectStudentVM
    
    var body: some View {
        List {
            ForEach(vm.groupedList.keys.sorted(), id: \.self) { key in
                Section(header: Text(key)) {
                    ForEach(vm.groupedList[key]!, id: \.self) { student in
                        StudentSelectionView(selectedStudent: $vm.em.student, student: student)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

private struct StudentSelectionView: View {
    
    @Binding var selectedStudent: StudentEntity?
    
    let student : StudentEntity
    
    var highlight: Bool {
        return selectedStudent == student
    }
    
    var body: some View {
        HStack(spacing: 4) {
            Text(student.firstName!)
                .font(.body.weight(highlight ? .regular : .light))
            Text(student.lastName!)
                .font(.body.weight(highlight ? .semibold : .regular))
                .lineLimit(1)
        }
        .onTapGesture {
            selectedStudent = student
        }
        .listRowBackground(highlight ? Color.accentColor : Color.white)
    }
}

struct SelectPersonView_Previews: PreviewProvider {
    static var previews: some View {
        SelectStudentView(vm: SelectStudentVM(em: EntityManager()))
            .previewLayout(.fixed(width: 180, height: 600))
    }
}

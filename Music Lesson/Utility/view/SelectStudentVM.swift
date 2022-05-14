//
//  SelectStudentVM.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 04.04.22.
//

import Foundation

class SelectStudentVM: ObservableObject {
    
    @Published var em: EntityManager
    
    @Published var list: [StudentEntity] = []
    @Published var groupedList: [String: [StudentEntity]] = [:]
    @Published var query: String = "" {
        didSet { updateList() }
    }
    
    init(em: EntityManager) {
        self.em = em
        updateList()
    }
    
    private func updateList() {
        if(query.isEmpty) {
            list = em.studentManager.studentList
        } else {
            list = getSubList()
        }
        groupedList = getGroupedList(list)
    }
    
    private func getGroupedList(_ studentList: [StudentEntity]) -> [String: [StudentEntity]] {
        return Dictionary(
            grouping: studentList,
            by: { $0.firstName!.first?.uppercased() ?? "" }
        )
    }
    
    private func getSubList() -> [StudentEntity] {
        var list: [StudentEntity] = []
        for student in em.studentManager.studentList {
            if(rightStart(student.firstName!)) {
                list.append(student)
            }
        }
        return list
    }
    
    private func rightStart(_ firstName: String) -> Bool {
        return firstName.prefix(query.count).caseInsensitiveCompare(query) == ComparisonResult.orderedSame
    }
}

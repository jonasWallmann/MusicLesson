//
//  StudentManager.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 23.02.22.
//

import Foundation
import CoreData

class StudentManager {
    
    let db = CoreDataManager.instance.context
    
    var studentList: [StudentEntity] = []
    
    init() {
        fetchStudentList()
    }
    
    private func fetchStudentList() {
        let request = NSFetchRequest<StudentEntity>(entityName: "StudentEntity")
        do {
            studentList = try db.fetch(request)
            studentList.sort { $0.firstName! < $1.firstName! }
        } catch let error {
            print("!!!Error fetching person list!!! \(error.localizedDescription)")
        }
    }
    
    private func getStudent(firstName: String, lastName: String) -> StudentEntity? {
        for student in studentList {
            if(student.firstName! == firstName && student.lastName == lastName) {
                return student
            }
        }
        return nil
    }
    
    func addStudent(model: StudentModel) -> StudentEntity {
        
        if let existingStudent: StudentEntity = getStudent(firstName: model.firstName, lastName: model.lastName) {
            return existingStudent
        }
        
        let newStudent: StudentEntity = StudentEntity(context: db)
        
        newStudent.firstName = model.firstName
        newStudent.lastName = model.lastName
        newStudent.gender = model.gender
        
        newStudent.phone = model.phone
        newStudent.birthDate = model.birthDate
        
        newStudent.zipCode = model.street
        newStudent.city = model.city
        newStudent.street = model.street
        
        newStudent.instrument = model.instrument
        
        save()
        return newStudent
    }
    
    private func save() {
        do {
            try self.db.save()
        } catch let error {
            print("!!!Error saving Core Data!!! \(error.localizedDescription)")
        }
        studentList = []
        self.fetchStudentList()
    }
    
    func delete(_ student: StudentEntity) {
        db.delete(student)
        save()
    }
}

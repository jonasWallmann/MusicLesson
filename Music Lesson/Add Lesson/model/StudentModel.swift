//
//  PersonModel.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.04.22.
//

import Foundation

class StudentModel {
        
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var gender: String = ""

    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var birthDate: Date = Date()
    
    @Published var zipCode: String = ""
    @Published var city: String = ""
    @Published var street: String = ""
    
    @Published var instrument: String = ""
}

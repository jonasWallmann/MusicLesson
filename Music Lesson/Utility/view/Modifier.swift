//
//  Modifier.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 01.03.22.
//

import Foundation
import SwiftUI

struct ButtonPadding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 7.5)
            .padding(.horizontal)
    }
}

extension View {
    func buttonPadding() -> some View {
        modifier(ButtonPadding())
    }
}


struct ButtonModifier: ViewModifier {
    
    var highlight: Bool = true
    
    func body(content: Content) -> some View {
        content
            .buttonPadding()
            .background(highlight ? Color.accentColor : .white)
            .foregroundColor(highlight ? .white : .black)
            .cornerRadius(8)
    }
}

extension View {
    func buttonModifier(highlight: Bool = true) -> some View {
        modifier(ButtonModifier(highlight: highlight))
    }
}



struct SpecialTextInput: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(height: 27)
            .textFieldStyle(PlainTextFieldStyle())
            .cornerRadius(5)
            .padding(.leading, 7)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
            .padding(10)
    }
}


extension View {
    func specialTextInput() -> some View {
        modifier(SpecialTextInput())
    }
}

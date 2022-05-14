
import SwiftUI

class DateUtility {
    
    static let weekdays: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    
    // MARK: create -------------------------------------------
    
    static func makeDate(year: Int = 1, month: Int = 1, day: Int = 1, hr: Int = 1, min: Int = 1) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min)
        return calendar.date(from: components)!
    }
    
    static func makeDate(_ str: String) -> Date {
        let dateFormatter = DateFormatter()
        return dateFormatter.date(from: str)!
    }
    
    static func string(fromDate: Date) -> String {
        let dateFormatter = DateFormatter()
        return dateFormatter.string(from: fromDate)
    }
    
    static func onlyTime(fromDate: Date) -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.hour, .minute], from: fromDate))!
    }
    
    // MARK: change ----------------------------------------------
    
    static func addTime(toDate: Date, min: Int) -> Date {
        var dateComponent = DateComponents()
        dateComponent.minute = min
        return Calendar.current.date(byAdding: dateComponent, to: toDate)!
    }
    
    static func subtractTime(toDate: Date, min: Int) -> Date {
        return addTime(toDate: toDate, min: -min)
    }
    
    
    // MARK: between ------------------------------------------------
    
    static func minuetesBetween(_ fromDate: Date, _ toDate: Date) -> Int {
        let fromSecconds: Double = onlyTime(fromDate: fromDate).timeIntervalSinceReferenceDate
        let toSecconds: Double = onlyTime(fromDate: toDate).timeIntervalSinceReferenceDate
        let secconds: Double = toSecconds - fromSecconds
        let minutes = Int(secconds / 60)
        return minutes
    }
    
    static func daysBetween(_ fromDate: Date, _ toDate: Date) -> Int {
        return Int(minuetesBetween(fromDate, toDate) / 60 / 24)
    }
    
    
    // MARK: components -----------------------------------------------
    
    static func getComponent(_ component: String, fromDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = component
        return dateFormatter.string(from: fromDate)
    }
    
    static func getYear(_ fromDate: Date) -> Int {
        return Int(getComponent("yyyy", fromDate: fromDate))!
    }
    
    static func getMonth(_ fromDate: Date) -> Int{
        return Int(getComponent("mm", fromDate: fromDate))!
    }
}

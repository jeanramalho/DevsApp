//
//  Date+Extensions.swift
//  DevsApp
//
//  Created by Jean Ramalho on 29/10/25.
//
import Foundation

extension Date {
    // Ex: "29/10/25" (curto)
    func formattedShort() -> String {
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .none
        df.locale = Locale(identifier: "pt_BR")
        return df.string(from: self)
    }
    
    // Ex: "23:45"
    func formattedHourMinute() -> String {
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        df.locale = Locale(identifier: "pt_BR")
        return df.string(from: self)
    }
}

//
//  File.swift
//  
//
//  Created by Bastiaan Meelberg on 09/05/2024.
//

import Foundation

extension DateFormatter {
    static let linkDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "Europe/Amsterdam")
        formatter.locale = Locale(identifier: "nl")
        // 2021-11-28
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    static let notamDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "UTC")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "d MMM yyyy - HH:mm"
        return formatter
    }()
    
    static let utcHourMinute: DateFormatter = {
        let formatter = DateFormatter()
        //formatter.locale = Locale(identifier: "UTC")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    static let utcHourMinuteSeconds: DateFormatter = {
        let formatter = DateFormatter()
        //formatter.locale = Locale(identifier: "UTC")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()
    
    static let ltMinuteSeconds: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()
}

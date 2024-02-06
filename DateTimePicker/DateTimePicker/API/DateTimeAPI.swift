//
//  DateTimeAPI.swift
//  DateTimePicker
//
//  Created by Sakshi Patil on 05/02/2024.
//

import Foundation

// Fetches a mock API date string representing 06:30 on the current day.
func fetchMockAPIDate( dateFormatter: DateFormatter) async -> String? {
    let now = Date()
    let calendar = Calendar.current
    let startOfDay = calendar.startOfDay(for: now)

    if let dateAt0630 = calendar.date(byAdding: .hour, value: 6, to: startOfDay),
       let dateAt0630Plus30Minutes = calendar.date(byAdding: .minute, value: 30, to: dateAt0630) {
        
        let dateString = dateFormatter.string(from: dateAt0630Plus30Minutes)
        return dateString
    }
    return nil
}


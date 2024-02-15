//
//  StartViewModel.swift
//  DateTimePicker
//
//  Created by Sakshi Patil on 14/02/2024.
//

import Foundation
import Foundation

class StartViewModel: NSObject {
    
    // Provides welcome message for start view depending on if check in date exists.
    @objc func getWelcomeMessage(for name: String) -> String {
        let latestCheckInDate = DataManager.shared.getLatestStoredTime(for: name)
        
        if let checkInDateStr = latestCheckInDate, let datePart = formatDate(checkInDateStr) {
            return "Hi \(name), welcome back. Your last check-in date is: \(datePart)"
        } else {
            return "Please check in"
        }
    }
    
    // Formatting date because we only need date for start view.
    private func formatDate(_ dateString: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: dateString) {
            return outputFormatter.string(from: date)
        } else {
            return nil
        }
    }
}



    
   


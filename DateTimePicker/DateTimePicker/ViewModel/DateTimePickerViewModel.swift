//
//  DateTimePickerViewModel.swift
//  DateTimePicker
//
//  Created by Sakshi Patil on 05/02/2024.
//

import Foundation

class DateTimePickerViewModel: ObservableObject {
    
    /// The date selected by the user.
    @Published var selectedDate: Date = Date()
    
    /// `true` if date and time is successfully submitted.
    @Published var isSubmitted: Bool = false
    
    /// `true` if user selects a date in future, triggering an alert.
    @Published var showAlert: Bool = false
    
    /// DateFormatter to ensure consistent date formatting.
    private var dateFormatter: DateFormatter =  DateFormatter()

    /// `true` if the selectedDate is in the future relative to today's date.
    var isDateInFuture: Bool {
        let now = Date()
        let today = Calendar.current.startOfDay(for: now)
        let startOfSelectedDate = Calendar.current.startOfDay(for: selectedDate)
        return startOfSelectedDate > today
    }

    // Sets up the initial state of the date picker
    func onAppear() async  {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = TimeZone.current // Set the formatter's timezone to current
        await initializeDate()
    }

    // Fetches the most recent check-in time or defaults to a mock API date on first launch.
    func initializeDate() async {
        if let lastDateTime = DataManager.shared.getLatestStoredTime(username: "Casper")  {
           if let date = dateFormatter.date(from: lastDateTime) {
              selectedDate = date
            }
        } else {
           if  let dateString = await fetchMockAPIDate(dateFormatter: dateFormatter), let date = dateFormatter.date(from: dateString) {
               selectedDate = date
            }
        }
    }

    // Submits the selected date and time to the data store. If the date is in the future, it triggers an alert.
    func submitCheckInTime() {
        if isDateInFuture {
            showAlert = true
        } else {
            DataManager.shared.insertDateTime(dateTime:  dateFormatter.string(from: selectedDate),usernName: "Casper")
            isSubmitted = true
        }
    }
}


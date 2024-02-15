//
//  DateTimePickerView.swift
//  DateTimePicker
//
//  Created by Sakshi Patil on 05/02/2024.
//

import SwiftUI

/// A view for selecting and submitting a date and time.
struct DateTimePickerView: View {
    
    // Manage the data and logic for the date picker.
    @ObservedObject  private var dateTimeViewModel =  DateTimePickerViewModel()
    
    //Accesses the presentation mode of the view
    @Environment(\.presentationMode) var presentationMode
   
    var body: some View {
        VStack {
            Spacer()
            
            Text("Select Date and Time")
                .font(.title)
                .padding(.bottom, 20)
            
            DatePicker("", selection: $dateTimeViewModel.selectedDate, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(WheelDatePickerStyle())
                .padding()
            
            Spacer()
            
            Button("Submit") {
                dateTimeViewModel.submitCheckInTime()
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(dateTimeViewModel.isSubmitted ? Color.green : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal, 50)
            
            Spacer()
        }
        .padding()
        .task {
            await dateTimeViewModel.onAppear()
        }
        .alert(isPresented: $dateTimeViewModel.showAlert) {
            Alert(title: Text("Invalid Date"),
                  message: Text("The selected date is in the future. Please choose a valid date."),
                  dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct DateTimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimePickerView()
    }
}

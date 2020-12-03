//
//  DatePickerView.swift
//  demo
//
//  Created by Bigluck on 2020/12/03.
//

import SwiftUI

struct DatePickerView: View {
    @State private var pickedDate = Date()
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }
    
    var body: some View {
        VStack {
            DatePicker(selection: $pickedDate, in: ClosedRange(uncheckedBounds: (lower: Date(), upper: Date(timeIntervalSinceNow: 900000))), displayedComponents: .date) {
                Text("Select Date")
            }
            Text("\(dateFormatter.string(from: pickedDate))")
            
//            DatePicker(selection: $pickedDate, displayedComponents: [.date]) {
//                Text("Select Date")
//            }
            
            
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}

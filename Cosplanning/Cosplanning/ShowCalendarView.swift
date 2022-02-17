//
//  ShowCalendarView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 17/02/22.
//

import SwiftUI

struct ShowCalendarView: View {
    
    
    @State private var date = Date()
    @State private var currentdate = Date()
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    
    var body: some View {
        VStack{
        DatePicker(
            "Select Date",
            selection: $date,
            in: dateRange,
            displayedComponents: [.date]
        )
            .datePickerStyle(CompactDatePickerStyle())
            .padding()
        Spacer()
        Text("\(date)")
            .padding()
        Spacer()
    }
    }
}

struct ShowCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCalendarView()
    }
}

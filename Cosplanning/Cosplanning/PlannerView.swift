//
//  ContentView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 08/02/22.
//

import SwiftUI

struct PlannerView: View {
    
    @State private var date = Date()

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
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            Text("today")
                .padding()
        }
    }
}

struct PlannerView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerView()
    }
}

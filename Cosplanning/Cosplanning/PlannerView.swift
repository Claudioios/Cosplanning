//
//  ContentView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 08/02/22.
//

import SwiftUI

struct PlannerView: View {
    
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
        NavigationView{
            VStack{
                ScrollView(.horizontal)
                {
                    HStack{
                        Circle()
                            .frame(width: 75, height: 75)
                        Circle()
                            .frame(width: 75, height: 75)
                        Circle()
                            .frame(width: 75, height: 75)
                        Circle()
                            .frame(width: 75, height: 75)
                        Circle()
                            .frame(width: 75, height: 75)                        
                    }

                }
                .padding()
                Spacer()
                DatePicker(
                    "Select Date",
                    selection: $date,
                    in: dateRange,
                    displayedComponents: [.date]
                )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                    Spacer()
                Text("\(date)")
                    .padding()
                Spacer()
            }
            .navigationTitle("Planner")
        }

    }
}

struct PlannerView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerView()
    }
}

//
//  ContentView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 08/02/22.
//

import SwiftUI

struct PlannerView: View {
    
//    @State private var date = Date()
//    @State private var currentdate = Date()

//    let dateRange: ClosedRange<Date> = {
//        let calendar = Calendar.current
//        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
//        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
//        return calendar.date(from:startComponents)!
//            ...
//            calendar.date(from:endComponents)!
//    }()
    
    
    var body: some View {
        NavigationView{
            ScrollView(){
            VStack{
                Button{}
            label:
                {
                    Text("Add Money")
                        .frame(width: 125)
                        .padding()
                        .foregroundColor(Color(.white))
                        .background(Color("ViolaBottone"))
                        .clipShape(Capsule())
                        .shadow(color: Color.gray, radius: 5, x: -2, y: -2)
                }
            }
                ScrollView(.horizontal)
                {
                    HStack{
                        Circle()
                            .frame(width: 75, height: 75)
                            .foregroundColor(Color("ViolaBottone"))
                        Circle()
                            .frame(width: 75, height: 75)
                            .foregroundColor(Color("ViolaBottone"))
                        Circle()
                            .frame(width: 75, height: 75)
                            .foregroundColor(Color("ViolaBottone"))
                        Circle()
                            .frame(width: 75, height: 75)
                            .foregroundColor(Color("ViolaBottone"))
                        Circle()
                            .frame(width: 75, height: 75)
                            .foregroundColor(Color("ViolaBottone"))
                    }

                }
                .padding()
                Spacer()
                VStack{
                    PlannerTaskView()
                    PlannerTaskView()
                    PlannerTaskView()
                }
//                DatePicker(
//                    "Select Date",
//                    selection: $date,
//                    in: dateRange,
//                    displayedComponents: [.date]
//                )
//                    .datePickerStyle(GraphicalDatePickerStyle())
//                    .padding()
//                    Spacer()
//                Text("\(date)")
//                    .padding()
//                Spacer()
            }
            .navigationTitle("Planner")
            .background(
                Image("Background"))
                
            }
        

    }
}

struct PlannerView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerView()
    }
}

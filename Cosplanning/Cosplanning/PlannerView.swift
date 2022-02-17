//
//  ContentView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 08/02/22.
//

import SwiftUI

struct PlannerView: View {
    @State private var showingAddRemove = false
    @State private var showingNewTask = false
    @State private var showingCalendar = false
//
//    @State private var date = Date()
//    @State private var currentdate = Date()
//
//    let dateRange: ClosedRange<Date> = {
//        let calendar = Calendar.current
//        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
//        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
//        return calendar.date(from:startComponents)!
//            ...
//            calendar.date(from:endComponents)!
//    }()
//    
    
    var body: some View {
        NavigationView{
            VStack{
            Rectangle()
                    .frame(width: .infinity, height: 55).ignoresSafeArea( edges: .top)
                .foregroundColor(Color("ViolaBottoneChiaro"))
            VStack{
                Button{

                    showingCalendar.toggle()
                    
//                    DatePicker(
//                        "Select Date",
//                        selection: $date,
//                        in: dateRange,
//                        displayedComponents: [.date]
//                    )
//                        .datePickerStyle(CompactDatePickerStyle())
//                        .padding()
//                        Spacer()
//                    Text("\(date)")
//                        .padding()
//                    Spacer()
                }
            label:
                {
                    Text("Calendar")
                        .frame(width: 125)
                        .padding()
                        .foregroundColor(Color(.white))
                        .background(Color("ViolaBottone"))
                        .clipShape(Capsule())
                        .shadow(color: Color.gray, radius: 5, x: -2, y: -2)
                }
                .sheet(isPresented: $showingCalendar) {
                    ShowCalendarView()
                }
            }
                Spacer()
                ScrollView(){
                    Spacer()
                VStack{
                    PlannerTaskView()
                    PlannerTaskView()
                    PlannerTaskView()
                }
                }
//                DatePicker(
//                    "Select Date",
//                    selection: $date,
//                    in: dateRange,
//                    displayedComponents: [.date]
//                )
//                    .datePickerStyle(CompactDatePickerStyle())
//                    .padding()
//                    Spacer()
//                Text("\(date)")
//                    .padding()
//                Spacer()
            }
            
            .navigationTitle("Planner")
            .background(
                Image("Background"))
                
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                Button{
                    showingAddRemove.toggle()
                }
            label: {
                Label ("add", systemImage: "plus.circle.fill")
                    .foregroundColor(Color("Giallo"))
            }
            .sheet(isPresented: $showingAddRemove) {
                NewTaskView()
            }
                }
            }
            }
        
        

    }
}

struct PlannerView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerView()
    }
}

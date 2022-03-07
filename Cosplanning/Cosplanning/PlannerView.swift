//
//  ContentView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 08/02/22.
//

import SwiftUI
import CoreData

struct PlannerView: View {
    let SelectDate = NSLocalizedString("SelectDate", comment: "SelectDate")
    let ThereIsNothing = NSLocalizedString("ThereIsNothing", comment: "ThereIsNothing")
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
    
    @State private var showingAddRemove = false
    @State private var showingNewTask = false
    @State private var showingCalendar = false
    
    @State private var x = 1
    
    @State private var date = Date()
    @State private var currentdate = Date()
    
//    let dateRange: ClosedRange<Date> = {
//        let calendar = Calendar.current
//        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
//        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
//        return calendar.date(from:startComponents)!
//        ...
//        calendar.date(from:endComponents)!
//    }()
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<PlannerOperation>
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
    func DeleteElement(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let operation = operations[offset]
            
            // delete it from the context
            add.delete(operation)
        }
        
        // save the context
        try? add.save()
    }
    
    var body: some View {
        NavigationView{
            VStack{
            Rectangle()
                    .frame(width: .infinity, height: 55).ignoresSafeArea( edges: .top)
                .foregroundColor(Color("ViolaBottoneChiaro"))
//            VStack{
//                Button{
//
//                    showingCalendar.toggle()
//
////                    DatePicker(
////                        "Select Date",
////                        selection: $date,
////                        in: dateRange,
////                        displayedComponents: [.date]
////                    )
////                        .datePickerStyle(CompactDatePickerStyle())
////                        .padding()
////                        Spacer()
////                    Text("\(date)")
////                        .padding()
////                    Spacer()
//                }
//            label:
//                {
//                    Text("\(CalendarButton)")
//                        .frame(width: 125)
//                        .padding()
//                        .foregroundColor(Color(.white))
//                        .background(Color("ViolaBottone"))
//                        .clipShape(Capsule())
//                }
//                .sheet(isPresented: $showingCalendar) {
//                    ShowCalendarView()
//                }
//            }
                VStack{
                DatePicker(
                    "\(SelectDate)",
                    selection: $date,
//                    in: dateRange,
                    displayedComponents: [.date]
                )
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding()
//                Spacer()
                Text("\(dateFormatter.string(from: date))")
                    .padding()
//                Spacer()
            }
                Spacer()
                
                    VStack{
                        Spacer()
                        if(operations.count > 0){
                            ScrollView{
                                ForEach(operations) { operation in
                                    if (dateFormatter.string(from: operation.date ?? Date.now) == dateFormatter.string(from: date)){
                                    PlannerTaskView(Title: operation.title ?? "Unknown", Description: operation.titledescription ?? "Unknown", Iden: operation.objectID)
                                    }
                                }
//                                .onDelete(perform: DeleteElement)
                            }
                            .padding()
                            .opacity(50)
                        }
                        else
                        {
                            VStack{
                                Image("emptyimage")
                                Text("\(ThereIsNothing)")
                                    .font(.title2)
                                    .foregroundColor(Color("ViolaBottoneChiaro"))
                                    .padding()
                            }
                        }
                        Spacer()
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
//                    x = x+1
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

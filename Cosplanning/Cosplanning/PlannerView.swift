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
                
                    VStack{
                        Spacer()
                        if(2 > 1){
                            List{
                                ForEach(operations) { operation in
                                    PlannerTaskView(Title: operation.title ?? "Unknown", Description: operation.titledescription ?? "Unknown")
                                        
                                }
                                .onDelete(perform: DeleteElement)
                            }
                        }
                        else
                        {
                            VStack{
                                Image("emptyimage")
                                    .background()
                                Text("There is nothing here")
                                    .font(.title2)
                                    .foregroundColor(Color("ViolaBottone"))
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

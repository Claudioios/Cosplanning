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
    
    
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<PlannerOperation>
    
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
                        //                    x = x+1
                        showingCalendar.toggle()
                    }
                label: {
                    Text("\(dateFormatter.string(from: date ?? Date.now))")
                        .frame(width: 150)
                        .padding()
                        .foregroundColor(Color("WhiteBlack"))
                        .background(Color("ViolaBottoneChiaro"))
                        .clipShape(Capsule())
                }
                .sheet(isPresented: $showingCalendar) {
                    VStack{
                        
                        Spacer()
                        
                        DatePicker(
                            "",
                            selection: $date,
                            //                    in: dateRange,
                            displayedComponents: [.date]
                        )
                            .labelsHidden()
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                            .background(Color("WhiteBlack"))
                        Spacer()
                        
                        Button{
                            showingCalendar.toggle()
                            
                        }
                    label:
                        {
                            Image(systemName: "checkmark")
                                .frame(width: 125)
                                .padding()
                                .foregroundColor(Color(.white))
                                .background(Color("ViolaBottone"))
                                .clipShape(Capsule())
                        }
                    }
                    .background(Image("Background"))
                }
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

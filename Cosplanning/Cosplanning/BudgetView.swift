//
//  BudgetView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI

struct BudgetView: View {
    
    @State private var showingAddRemove = false
    @State private var money : Double = 0
    @State private var x = 250

    let Money : Double = 0
    
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<BudgetOperation>

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
                    .frame(width: .infinity, height: 50).ignoresSafeArea( edges: .top)
                    .foregroundColor(Color("ViolaBottoneChiaro"))
                VStack {
//                    List{
//                        ForEach(operations) { operation in
//                            Text(operation.shortdescription ?? "Unknown")
//                        }
//                        .onDelete(perform: DeleteElement)
//                    }
                    HStack
                    {
//                        Button("Add") {
//
//                            let NewOperation = BudgetOperation(context: add)
//                            NewOperation.money = Money
//                            NewOperation.shortdescription = "Ciao"
//                            NewOperation.date = Date.now
//                            // more code to come
//
//                            try? add.save()
//                        }
                    }
                    
                }
                ScrollView()
                {
                    Rectangle()
                        .frame(width: 350, height: 200)
                        .cornerRadius(43)
                        .foregroundColor(Color("Giallo"))
                        .padding()
                        .overlay()
                    {
                        Text("\(money, specifier: "%.2f")$")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()
                    }
                    HStack{
                        HStack{
                            Spacer()
                            Button{
                                showingAddRemove.toggle()
//                                    let NewOperation = BudgetOperation(context: add)
//                                    NewOperation.money = Money
//                                    NewOperation.shortdescription = "Ciao"
//                                    NewOperation.date = Date.now
//                                    // more code to come
//
//                                    try? add.save()
                                }
                        label:
                            {
                                Text("Add Money")
                                    .frame(width: 125)
                                    .padding()
                                    .foregroundColor(Color(.white))
                                    .background(Color("ViolaBottone"))
                                    .clipShape(Capsule())
                            }
                            .sheet(isPresented: $showingAddRemove) {
                                AddRemoveMoneyView()
                            }
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            Spacer()
                            Button{showingAddRemove.toggle()}
                        label:
                            {
                                Text("Remove Money")
                                    .frame(width: 125)
                                    .padding()
                                    .foregroundColor(Color(.white))
                                    .background(Color("ViolaBottone"))
                                    .clipShape(Capsule())
                            }
                            .sheet(isPresented: $showingAddRemove) {
                                AddRemoveMoneyView()
                            }
                            Spacer()
                        }
                    }
                    VStack{
                        Rectangle()
                            .frame(width: 350, height: CGFloat(x))
                            .foregroundColor(.white)
                            .border(Color.gray)
                            .cornerRadius(43)
                            .padding()
                            .overlay()
                        {
                            ScrollView(){
                            VStack{
                                Spacer()
                                if(operations.count > 0){
                                    
//                                    ForEach(0..<ArrayBudgetOperations.ArrayBudgetOperations.count) { ind in
                                        
//                                        BudgetListView(ind: ind, ArrayBudgetOperations: ArrayBudgetOperations)
                                            ForEach(operations) { operation in
                                                BudgetListView(Money: operation.money ?? 0, Description: operation.shortdescription ?? "Unknown", date: operation.date ?? Date.now)
                                                    
                                               
                                            }
                                            .foregroundColor(Color("ViolaBottoneChiaro"))
//                                            .onDelete(perform: DeleteElement)
                                        
                                
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
                            }
                            .padding()
                            
                        }
                        
                    }
                    
                    
                }
            }
            .navigationTitle("Budget")
            .background(Image("Background"))
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button{
                        showingAddRemove.toggle()
                    }
                label: {
                    Label ("Filter", systemImage: "line.3.horizontal.decrease.circle.fill")
                        .foregroundColor(Color("Giallo"))
                }
                .sheet(isPresented: $showingAddRemove) {
                    AddRemoveMoneyView()
                }
                }
            }
        }
    }
}
struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}

//
//  BudgetView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI

struct BudgetView: View {
    
    let ThereIsNothing = NSLocalizedString("ThereIsNothing", comment: "ThereIsNothing")
    let NewOperation = NSLocalizedString("NewOperation", comment: "NewOperation")
    
    @State private var showingAddRemove = false
    //    @State private var money : Double = 0
    @AppStorage("Money") private var money : Double = 0.0
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
                Spacer()
                VStack(){
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
                                Text("\(NewOperation)")
                                    .frame(width: 225)
                                    .padding()
                                    .foregroundColor(Color(.white))
                                    .background(Color("ViolaBottone"))
                                    .clipShape(Capsule())
                            }
                            .sheet(isPresented: $showingAddRemove) {
                                AddRemoveMoneyView(money: $money)
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    VStack{
                        Rectangle()
                            .frame(width: 351, height: CGFloat(x + 1))
                            .background(Color.gray)
                            .cornerRadius(43)
                            .padding()
                            .overlay()
                        {
                            Rectangle()
                                .frame(width: 350, height: CGFloat(x))
                                .foregroundColor(.white)
                            //                            .border(Color.gray)
                                .cornerRadius(42)
                                .padding()
                                .overlay()
                            {
                                ScrollView(showsIndicators: false){
                                    VStack{
                                        Spacer()
                                        if(operations.count > 0){
                                            
                                            //                                    ForEach(0..<ArrayBudgetOperations.ArrayBudgetOperations.count) { ind in
                                            
                                            //                                        BudgetListView(ind: ind, ArrayBudgetOperations: ArrayBudgetOperations)
                                            ForEach(operations) { operation in
                                                BudgetListView(Money: operation.money ?? 0, Description: operation.shortdescription ?? "Unknown", date: operation.date ?? Date.now, typeOperation: operation.typeOperation ?? "Add")
                                                    .contextMenu()
                                                {
                                                    Button(action: {
                                                        if (operation.typeOperation == "Add")
                                                        {
                                                            money = money - operation.money
                                                        }
                                                        else
                                                        {
                                                            money = money + operation.money
                                                        }
                                                        add.delete(operation)
                                                        try? add.save()
                                                    })
                                                    {
                                                        HStack{
                                                            Image(systemName: "trash")
                                                            Text("Delete")
                                                            
                                                        }
                                                        
                                                    }
                                                }
                                                
                                                
                                            }
                                            //      .onDelete(perform: DeleteElement)
                                            .foregroundColor(Color("ViolaBottoneChiaro"))
                                            
                                            
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
                                .padding()
                                
                            }
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("Budget")
            .background(Image("Background"))
        }
    }
}
struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}

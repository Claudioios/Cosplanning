//
//  InventoryView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 08/02/22.
//

import SwiftUI
struct InventoryView: View {
    @State private var showingAddRemove = false
    @State private var inventory = 1
    
    @ObservedObject var ArrayInventoryOperations: ArrayInventoryModel
    
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<InventoryOperation>
    
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
                Spacer()
                
                VStack{
                    Spacer()
                    if(inventory > 0){
                        List{
                            ForEach(operations) { operation in
                                InventoryCardView(Name: operation.materialname ?? "Unknow", Price: operation.price ?? 0.0, Quantity: operation.quantity ?? 0)
                                    
                               
                            }
                            .onDelete(perform: DeleteElement)
                            
//                            .onDelete(perform: DeleteElement)
                        }
                        .padding()
                        .opacity(50)
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
            .navigationTitle("Inventory")
            .background(Image("Background"))
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                Button{
//                    inventory = inventory+1
                    showingAddRemove.toggle()
                }
            label: {
                Label ("Add", systemImage: "plus.circle.fill")
                    .foregroundColor(Color("Giallo"))
            }
            .sheet(isPresented: $showingAddRemove) {
                AddInventoryView()
            }
        }
    }
}
    }
}
struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView(ArrayInventoryOperations: .init())
    }
}

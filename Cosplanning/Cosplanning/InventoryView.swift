//
//  InventoryView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 08/02/22.
//

import SwiftUI
struct InventoryView: View {
    @State private var showingAddRemove = false
    @State private var inventory = 0
    
    @ObservedObject var ArrayInventoryOperations: ArrayInventoryModel
    
    var body: some View {
        NavigationView{
            VStack{
                Rectangle()
                    .frame(width: .infinity, height: 55).ignoresSafeArea( edges: .top)
                    .foregroundColor(Color("ViolaBottoneChiaro"))
                Spacer()
                
                VStack{
                    Spacer()
                    if(ArrayInventoryOperations.ArrayInventoryOperations.count > 0){
                    ForEach(0..<ArrayInventoryOperations.ArrayInventoryOperations.count) { ind in
                        
                        InventoryCardView(ind: ind, ArrayInventoryOperations: ArrayInventoryOperations)
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
                
            
            }
            .navigationTitle("Inventory")
            .background(Image("Background"))
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                Button{
                    showingAddRemove.toggle()
                }
            label: {
                Label ("Add", systemImage: "plus.circle.fill")
                    .foregroundColor(Color("Giallo"))
            }
            .sheet(isPresented: $showingAddRemove) {
                AddInventoryView(ArrayInventoryOperations: ArrayInventoryOperations)
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

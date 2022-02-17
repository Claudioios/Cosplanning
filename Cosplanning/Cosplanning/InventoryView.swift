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
    var body: some View {
        NavigationView{
            VStack{
                Rectangle()
                    .frame(width: .infinity, height: 55).ignoresSafeArea( edges: .top)
                    .foregroundColor(Color("ViolaBottoneChiaro"))
                Spacer()
                
                VStack{
                    Spacer()
                    if (inventory == 1){
                        VStack{
                            Image("emptyimage")
                                .background()
                            Text("There is nothing here")
                                .font(.title2)
                                .foregroundColor(Color("ViolaBottone"))
                                .padding()
                        }
                    }
                    else
                    {
                        ScrollView()
                        {
                            InventoryCardView()
                            Spacer()
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
                AddInventoryView()
            }
        }
    }
}
    }
}
struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView()
    }
}

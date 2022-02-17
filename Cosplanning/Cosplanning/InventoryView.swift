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
                    if inventory == 0{
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
                    Button{showingAddRemove.toggle()}
                label:
                    {
                        Text("Add materials")
                            .frame(width: 125)
                            .padding()
                            .foregroundColor(Color(.white))
                            .background(Color("ViolaBottone"))
                            .clipShape(Capsule())
                            .shadow(color: Color.gray, radius: 5, x: -2, y: -2)
                    }
                    .sheet(isPresented: $showingAddRemove) {
                        AddRemoveMoneyView()
                    }
                }
                .padding()
                .navigationTitle("Inventory")
                .background(Image("Background"))
            }
        }
    }
}


struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView()
    }
}

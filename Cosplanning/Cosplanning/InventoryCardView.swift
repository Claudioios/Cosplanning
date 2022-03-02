//
//  AddInventoryView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 17/02/22.
//

import SwiftUI

struct InventoryCardView: View {
    @State private var Ntasks = 0
        
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<InventoryOperation>
    
    var Name: String
    var Price: Double
    var Quantity: Int64
    
    init(Name: String, Price: Double, Quantity: Int64) {
        self.Name = Name
        self.Price = Price
        self.Quantity = Quantity
    }
    
    var body: some View {
        NavigationLink(destination: ShowInventoryView()){
        HStack{
            Rectangle()
                .frame(width: 350, height: 100)
                .cornerRadius(43)
                .foregroundColor(.white)
                .padding()
                .overlay()
            {
                HStack{
                    Text("\(Name)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.leading, 50.0)
                    Spacer()
                    HStack{
                        VStack{
                            Spacer()
                            Text("Price")
                            Spacer()
                            Text("\(Price, specifier: "%.2f")")
                            Spacer()
                        }
                        Divider()
                            .padding()
                        VStack{
                            Spacer()
                            Text("Quantity")
                            Spacer()
                            Text("\(Quantity) $")
                            Spacer()

                            
                        }
                        .padding(.trailing, 50.0)
                    }
                }
                
            }
        }
    }
}
}
struct InventoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryCardView(Name: "Ciao", Price: 10.0, Quantity: 1)
    }
}

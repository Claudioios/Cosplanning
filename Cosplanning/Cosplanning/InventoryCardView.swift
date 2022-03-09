//
//  AddInventoryView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 17/02/22.
//

import SwiftUI
import CoreData
struct InventoryCardView: View {
    @State private var Ntasks = 0
    let PriceLock = NSLocalizedString("Price", comment: "Price")
    let QuantityLock = NSLocalizedString("Quantity", comment: "Quantity")
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<InventoryOperation>
    
    var Name: String
    var Price: Double
    var Quantity: Int64
    var Iden: NSManagedObjectID
    init(Name: String, Price: Double, Quantity: Int64, Iden: NSManagedObjectID) {
        self.Name = Name
        self.Price = Price
        self.Quantity = Quantity
        self.Iden = Iden
    }
    
    var body: some View {
        NavigationLink(destination: ShowInventoryView(Name: Name, Price: Price, Quantity: Quantity, Iden: Iden)){
            HStack{
                Rectangle()
                    .frame(width: 350, height: 100)
                    .cornerRadius(43)
                    .foregroundColor(Color("ViolaBottoneChiaro"))
                    .padding()
                    .overlay()
                {
                    HStack{
                        Text("\(Name)")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("WhiteBlack"))
                            .padding(.leading, 50.0)
                        Spacer()
                        HStack{
                            VStack{
                                Spacer()
                                Text("\(PriceLock)")
                                    .foregroundColor(Color("WhiteBlack"))
                                Spacer()
                                Text("\(Price, specifier: "%.2f") $")
                                    .foregroundColor(Color("WhiteBlack"))
                                Spacer()
                            }
                            Divider()
                                .padding()
                            VStack{
                                Spacer()
                                Text("\(QuantityLock)")
                                    .foregroundColor(Color("WhiteBlack"))
                                Spacer()
                                Text("\(Quantity)")
                                    .foregroundColor(Color("WhiteBlack"))
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
//struct InventoryCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        InventoryCardView(Name: "Ciao", Price: 10.0, Quantity: 1, Iden: "")
//    }
//}

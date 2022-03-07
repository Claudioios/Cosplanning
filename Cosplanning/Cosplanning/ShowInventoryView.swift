//
//  ShowInventoryView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 02/03/22.
//

import SwiftUI
import CoreData

struct ShowInventoryView: View {
    //    @State private var Name: String = ""
    //    @State private var Price: Double
    //    @State private var Quantity: Int64
    @Environment(\.dismiss) var dismiss
    
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
       
        VStack{
        
            Rectangle()
                .frame(width: .infinity, height: 55).ignoresSafeArea( edges: .top)
                .foregroundColor(Color("ViolaBottoneChiaro"))
            
            
            
        VStack{
            Spacer()
            ForEach(operations) { operation in
                if (Iden == operation.objectID)
                {
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
                      
                    }
                    }
                    }
                    HStack{
                        Rectangle()
                            .frame(width: 350, height: 100)
                            .cornerRadius(43)
                            .foregroundColor(Color("ViolaBottoneChiaro"))
                            .padding()
                            .overlay()
                        {
                            HStack{
                    Text("\(Price, specifier: "%.2f")")
                            }
                    }
                    }
                    HStack{
                        Rectangle()
                            .frame(width: 350, height: 100)
                            .cornerRadius(43)
                            .foregroundColor(Color("ViolaBottoneChiaro"))
                            .padding()
                            .overlay()
                        {
                            HStack{
                        
                    Text("\(Quantity)")
                            }
                    }
                    }
                    Button{
                        add.delete(operation)
                        try? add.save()
                        InventoryView()
                        
                    }
                label:
                    {
                        Text("Delete")
                            .frame(width: 125)
                            .padding()
                            .foregroundColor(Color(.white))
                            .background(Color(UIColor.systemRed))
                            .clipShape(Capsule())
                    }
                }
         
                Spacer()
            }
            
        }
        .padding()
        }
        .background(Image("Background"))
    }
}
//struct ShowInventoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowInventoryView(Name: "", Price: 0.0, Quantity: 0)
//    }
//}

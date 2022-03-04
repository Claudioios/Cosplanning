//
//  ShowInventoryView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 02/03/22.
//

import SwiftUI

struct ShowInventoryView: View {
    @State private var Name: String = ""
    @State private var Price: String = ""
    @State private var Quantity: String = ""
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<InventoryOperation>
    
    var body: some View {
        VStack{
            ForEach(operations) { operation in
                InventoryCardView(Name: operation.materialname ?? "Unknow", Price: operation.price ?? 0.0, Quantity: operation.quantity ?? 0)
//                Text("\(operation.materialname?)")
//                Text("\(operation.price?)")
//                Text("\(operation.quantity?)")
//
                
            }
            
            
        }
    }
}
struct ShowInventoryView_Previews: PreviewProvider {
    static var previews: some View {
        ShowInventoryView()
    }
}

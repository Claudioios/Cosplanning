//
//  ShowInventoryView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 02/03/22.
//

import SwiftUI

struct ShowInventoryView: View {
    @ObservedObject var ArrayInventoryOperations: ArrayInventoryModel
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<InventoryOperation>
    
   
    
    var body: some View {
        ForEach(operations) { operation in
            InventoryCardView(Name: operation.materialname ?? "Unknow", Price: operation.price ?? 0.0, Quantity: operation.quantity ?? 0)
                
           
        }
    
}
}
struct ShowInventoryView_Previews: PreviewProvider {
    static var previews: some View {
        ShowInventoryView(ArrayInventoryOperations: .init())
    }
}

//
//  AddInventoryView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 17/02/22.
//

import SwiftUI

struct AddInventoryView: View {
    @State private var Name: String = ""
    @State private var Price: String = ""
    @State private var Quantity: String = ""
    @State private var Unit: String = ""
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<BudgetOperation>
    var body: some View {
        
            VStack{
                HStack{
                    Text("Name")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    TextField(
                        "",
                        text: $Name
                    )
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                }
                HStack{
                    Text("Price for piece")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    TextField(
                        "",
                        text: $Price
                    )
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                }
                HStack{
                    Text("Quantity")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    TextField(
                        "",
                        text: $Quantity
                    )
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                }

                Spacer()
                Button{
                    let NewOperation = InventoryOperation(context: add)
                    NewOperation.materialname = Name
                    NewOperation.price = Double(Price) ?? 0.0
                    NewOperation.quantity = Int64(Quantity) ?? 0
                    // more code to come
                    
                    try? add.save()
                    dismiss()
                    
                }
            label:
                {
                    Image(systemName: "checkmark")
                        .frame(width: 125)
                        .padding()
                        .foregroundColor(Color(.white))
                        .background(Color("ViolaBottone"))
                        .clipShape(Capsule())
                }
            }
            .padding()
            .background(Image("Background"))
            .onTapGesture {
                dismissKeyboard()
            }

        }
}

struct AddInventoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddInventoryView()
    }
}

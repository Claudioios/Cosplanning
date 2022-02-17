//
//  AddInventoryView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 17/02/22.
//

import SwiftUI

struct AddInventoryView: View {
    @State private var Material: String = ""
    @State private var Description: String = ""
    @State private var Quantity: String = ""
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Material")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    TextField(
                        "",
                        text: $Material
                    )
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                }
                HStack{
                    Text("Description")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    TextField(
                        "",
                        text: $Description
                    )
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
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
                }
                Spacer()
                Button{}
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
        }
    }
}

struct AddInventoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddInventoryView()
    }
}

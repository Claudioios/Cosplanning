//
//  AddInventoryView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 17/02/22.
//

import SwiftUI

struct InventoryCardView: View {
    @State private var Ntasks = 0
    @State private var Price = 0
    @State private var Qty = 0

    var body: some View {
        HStack{
            Rectangle()
                .frame(width: 350, height: 100)
                .cornerRadius(43)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 2, x: -2, y: -2)
                .padding()
                .overlay()
            {
                HStack{
                    Text("Type")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.leading, 50.0)
                    Spacer()
                    HStack{
                        VStack{
                            Spacer()
                            Text("Price")
                            Spacer()
                            Text("\(Price)")
                            Spacer()
                        }
                        Divider()
                            .padding()
                        VStack{
                            Spacer()
                            Text("Quantity")
                            Spacer()
                            Text("\(Qty)")
                            Spacer()

                            
                        }
                        .padding(.trailing, 50.0)
                    }
                }
                
            }
        }
    }
}

struct InventoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryCardView()
    }
}

//
//  AddInventoryView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 17/02/22.
//

import SwiftUI

struct InventoryCardView: View {
    @State private var Ntasks = 0
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: 350, height: 150)
                .cornerRadius(43)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 2, x: -2, y: -2)
                .padding()
                .overlay()
            {
                VStack{
                    HStack{
                        Text("Material")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("ViolaBottoneChiaro"))
                            .padding(.top, 30.0)
                            .padding(.leading, 50.0)
                        Spacer()
                        Circle()
                            .frame(width: 25, height: 25)
                            .padding(.top, 30.0)
                            .padding(.trailing, 60.0)
                            .foregroundColor(.green)
                    }
                    HStack{
                        Text("Material available: \(Ntasks)")
                            .font(.title3)
                            .fontWeight(.regular)
                            .padding(.leading, 50.0)
                        Spacer()
                    }
                    Spacer()
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

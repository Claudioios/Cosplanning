//
//  AddRemoveMoneyView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 15/02/22.
//

import SwiftUI

struct AddRemoveMoneyView: View {
    
    @State private var Money: String = ""
    @State private var Description: String = ""
    @State private var Date: String = ""
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Money")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    TextField(
                        "",
                        text: $Money
                    )
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                }
                HStack{
                    Text("Short Description")
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
                    Text("Date")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    TextField(
                        "",
                        text: $Date
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

struct AddRemoveMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        AddRemoveMoneyView()
    }
}

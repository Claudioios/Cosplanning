//
//  NewTaskView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 16/02/22.
//

import SwiftUI

struct NewTaskView: View {
    
    @State private var Title: String = ""
    @State private var Description: String = ""
    @State private var Material: String = ""
    @State private var WorkTime1: String = ""
    @State private var WorkTime2: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Title")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    TextField(
                        "",
                        text: $Title
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
                    Text("Work Time")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    TextField(
                        "",
                        text: $WorkTime1
                    )
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                    TextField(
                        "",
                        text: $WorkTime2
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

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
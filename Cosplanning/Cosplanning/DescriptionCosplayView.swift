//
//  DescriptionCosplayView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI

struct DescriptionCosplayView: View {
    var image: String
    var name: String
    var description: String
   
    var body: some View {
        ScrollView{
            VStack{
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .padding(.all)
                Text(name)
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .modifier(CardModifier())
                    .padding()
                Text(description)
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .modifier(CardModifier())
                    .padding()
                Text("Tasks")
                List
                {
                    NavigationLink( destination: TaskView()){
                    Text("Task1")
                    }
                    NavigationLink( destination: TaskView()){
                    Text("Task2")
                    }
                    NavigationLink( destination: TaskView()){
                    Text("Task3")
                    }
                    NavigationLink( destination: TaskView()){
                    Text("Task4")
                    }
                }
                
            }
        }
    }
}
struct DescriptionCosplayView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionCosplayView(image: "", name: "", description: "")
    }
}

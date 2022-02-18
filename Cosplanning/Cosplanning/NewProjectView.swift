//
//  NewProjectView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI

struct NewProjectView: View {
    @State private var start: String = ""
    @State private var task: String = ""
    var body: some View {
        VStack{
            HStack{
                Text("Project")
                    .font(.title)
                    .fontWeight(.regular)
                    .padding()
                Spacer()
            }
            HStack{
                TextField(
                    "",
                    text: $start
                )
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack{
                Text("Number of tasks")
                    .font(.title)
                    .fontWeight(.regular)
                    .padding()
                Spacer()
            }
            HStack{
                TextField(
                    "",
                    text: $task
                )
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack{
                Text("Select the color of your project:")
                    .font(.title)
                    .fontWeight(.regular)
                    .padding()
                Spacer()
            }
            .padding()
            
            ScrollView(.horizontal){
                HStack{
                    Circle()
                        .foregroundColor(.red)
                    Circle()
                        .foregroundColor(.green)
                    Circle()
                        .foregroundColor(.blue)
                    Circle()
                        .foregroundColor(.yellow)
                    Circle()
                        .foregroundColor(.black)
                    Circle()
                        .foregroundColor(.white)
                    
                }
                .frame(width: 600, height: 90)
            }
            
            
        }
        .padding()
        .background(Image("Background"))
        
    }
}

struct NewProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView()
    }
}

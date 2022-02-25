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
    @State private var r = 0
    @State private var g = 0
    @State private var b = 0
    @State private var y = 0
    @State private var gr = 0
    @State private var bl = 0
    
    @Environment(\.dismiss) var dismiss

    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<ProjectOperation>
    
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
                    .keyboardType(.decimalPad)
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
                    Button{
                        r  = r+1
                        g = 0
                        b = 0
                        y = 0
                        gr = 0
                        bl = 0
                    }
                    label : {
                    Circle()
                        .foregroundColor(.red)
                    }
                    Button{
                        g  = g+1
                        r = 0
                        b = 0
                        y = 0
                        gr = 0
                        bl = 0
                    }
                    label : {
                    Circle()
                        .foregroundColor(.green)
                    }
                    Button{
                        b  = b+1
                        r = 0
                        g = 0
                        y = 0
                        gr = 0
                        bl = 0
                    }
                    label : {
                    Circle()
                        .foregroundColor(.blue)
                    }
                    Button{
                        y  = y+1
                        r = 0
                        b = 0
                        g = 0
                        gr = 0
                        bl = 0
                    }
                    label : {
                    Circle()
                        .foregroundColor(.yellow)
                    }
                    Button{
                        gr  = gr+1
                        r = 0
                        b = 0
                        y = 0
                        g = 0
                        bl = 0
                    }
                    label : {
                    Circle()
                        .foregroundColor(.gray)
                    }
                    Button{
                        bl  = bl+1
                        r = 0
                        b = 0
                        y = 0
                        gr = 0
                        g = 0
                    }
                    label : {
                    Circle()
                        .foregroundColor(.black)
                    }
                }
                .frame(width: 600, height: 90)
            }
            Spacer()
                Button{
                    
                    
                    let NewOperation = ProjectOperation(context: add)
                    NewOperation.projectname = start
                    NewOperation.tasksnumber = Int64(task) ?? 0
                    NewOperation.colorproject = ""
//                  more code to come
                    
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
        
    }
}

struct NewProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView()
    }
}

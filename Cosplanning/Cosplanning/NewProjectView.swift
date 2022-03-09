//
//  NewProjectView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI

struct NewProjectView: View {
    
    let ProjectName = NSLocalizedString("ProjectName", comment: "ProjectName")
    
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
                Text("\(ProjectName)")
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
        .onTapGesture {
            dismissKeyboard()
        }
    }
}

struct NewProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView()
    }
}

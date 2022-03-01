//
//  ProfileView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 08/02/22.
//

import SwiftUI
import UIKit
struct ProjectView: View {
    @State private var showingAddRemove = false
    @State private var projects = 1
    
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<ProjectOperation>
    
    func DeleteElement(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let operation = operations[offset]
            
            // delete it from the context
            add.delete(operation)
        }
        
        // save the context
        try? add.save()
    }
    
    var body: some View {
        NavigationView{
                VStack{
                Rectangle()
                        .frame(width: .infinity, height: 55).ignoresSafeArea( edges: .top)
                    .foregroundColor(Color("ViolaBottoneChiaro"))

                    VStack{
                        Spacer()
                        if (operations.count > 0) {
                            ScrollView{
                                ForEach(operations) { operation in
                                    ProjectsCardView(Title: operation.projectname ?? "Unknown", TasksNumber: operation.tasksnumber, ColorProject: operation.colorproject ?? "Unknown")
                                        
                                   
                                }
//                                .onDelete(perform: DeleteElement)
                            }
                            .padding()
                            .opacity(50)
                        }
                        else
                        {
                            VStack{
                                Image("emptyimage")
                                    .background()
                                Text("There is nothing here")
                                    .font(.title2)
                                    .foregroundColor(Color("ViolaBottone"))
                                    .padding()
                            
                            }
                        }
                        Spacer()
                       
                    }
            .navigationTitle("Projects")
            .background(Image("Background"))
        }
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button{
//                        projects = projects+1
                        showingAddRemove.toggle()
                    }
                label: {
                    Label ("add", systemImage: "plus.circle.fill")
                        .foregroundColor(Color("Giallo"))
                }
                .sheet(isPresented: $showingAddRemove) {
                   NewProjectView()
                }
                    }
                }
        }
        
    }
    }
   
struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}

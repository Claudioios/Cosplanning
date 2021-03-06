//
//  ShowProjectView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 02/03/22.
//

import SwiftUI
import CoreData

struct ShowProjectView: View {
    
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<ProjectOperation>
    
    var Title: String
    var TasksNumber: Int64
    var ColorProject: String
    var Iden: NSManagedObjectID
    
    init(Title: String, TasksNumber: Int64, ColorProject: String, Iden: NSManagedObjectID) {
        self.Title = Title
        self.TasksNumber = TasksNumber
        self.ColorProject = ColorProject
        self.Iden = Iden
        
    }
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: .infinity, height: 55).ignoresSafeArea( edges: .top)
                .foregroundColor(Color("ViolaBottoneChiaro"))
            
            VStack{
                Spacer()
                ForEach(operations) { operation in
                    if (Iden == operation.objectID)
                    {                    
                        HStack{
                            Rectangle()
                                .frame(width: 350, height: 100)
                                .cornerRadius(43)
                                .foregroundColor(Color("ViolaBottoneChiaro"))
                                .padding()
                                .overlay()
                            {
                                HStack{
                                    Text("\(Title)")
                                        .foregroundColor(Color("WhiteBlack"))
                                }
                            }
                        }
                        HStack{
                            Rectangle()
                                .frame(width: 350, height: 100)
                                .cornerRadius(43)
                                .foregroundColor(Color("ViolaBottoneChiaro"))
                                .padding()
                                .overlay()
                            {
                                HStack{
                                    Text("\(TasksNumber)")
                                        .foregroundColor(Color("WhiteBlack"))
                                }
                            }
                        }
                        HStack{
                            Rectangle()
                                .frame(width: 350, height: 100)
                                .cornerRadius(43)
                                .foregroundColor(Color("ViolaBottoneChiaro"))
                                .padding()
                                .overlay()
                            {
                                HStack{
                                    Text("\(ColorProject)")
                                        .foregroundColor(Color("WhiteBlack"))
                                }
                            }
                        }
                        HStack{
                            Button{
                                add.delete(operation)
                                try? add.save()
                                ProjectView()
                            }
                        label:
                            {
                                Text("Completed")
                                    .frame(width: 125)
                                    .padding()
                                    .foregroundColor(Color(.white))
                                    .background(Color(UIColor.systemGreen))
                                    .clipShape(Capsule())
                            }
                            Button{
                                add.delete(operation)
                                try? add.save()
                                ProjectView()
                            }
                        label:
                            {
                                Text("Delete")
                                    .frame(width: 125)
                                    .padding()
                                    .foregroundColor(Color(.white))
                                    .background(Color(UIColor.systemRed))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    Spacer()
                }
                
            }
            .padding()
        }
        .background(Image("Background"))
    }
}

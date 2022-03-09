//
//  ProjectsCardView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 16/02/22.
//

import SwiftUI
import CoreData

struct ProjectsCardView: View {
    
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
        NavigationLink(destination: ShowProjectView(Title: Title, TasksNumber: TasksNumber, ColorProject: ColorProject, Iden: Iden)){
            HStack{
                Rectangle()
                    .frame(width: 350, height: 150)
                    .cornerRadius(43)
                    .foregroundColor(Color("ViolaBottoneChiaro"))
                    .padding()
                    .overlay()
                {
                    VStack{
                        HStack{
                            Text("\(Title)")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("WhiteBlack"))
                                .padding(.top, 30.0)
                                .padding(.leading, 50.0)
                            Spacer()
                        }
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

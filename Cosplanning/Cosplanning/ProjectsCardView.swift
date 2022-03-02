//
//  ProjectsCardView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 16/02/22.
//

import SwiftUI

struct ProjectsCardView: View {
    
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<ProjectOperation>

    var Title: String
    var TasksNumber: Int64
    var ColorProject: String
    
    init(Title: String, TasksNumber: Int64, ColorProject: String) {
        self.Title = Title
        self.TasksNumber = TasksNumber
        self.ColorProject = ColorProject
    }
    var body: some View {
        NavigationLink(destination: ShowProjectView()){
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
                        Text("\(Title)")
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
                        Text("Number of task: \(TasksNumber)")
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
}
struct ProjectsCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsCardView(Title: "Ciao", TasksNumber: 10, ColorProject: "red")
    }
}

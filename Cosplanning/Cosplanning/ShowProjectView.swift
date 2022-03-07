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
            
            ForEach(operations) { operation in
                if (Iden == operation.objectID)
                {                    
                    Text("\(Title)")
                    Text("\(TasksNumber)")
                    Text("\(ColorProject)")

                    Button{
                        add.delete(operation)
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

        }
    
}
}

//struct ShowProjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowProjectView(Title: "", TasksNumber: 0, ColorProject: "", Iden: <#NSManagedObjectID#>)
//    }
//}

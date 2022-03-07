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
                            }
                        }
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
                 Spacer()
            }

        }
        .padding()
        }
        .background(Image("Background"))
}
}

//struct ShowProjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowProjectView(Title: "", TasksNumber: 0, ColorProject: "", Iden: <#NSManagedObjectID#>)
//    }
//}

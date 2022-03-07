//
//  ShowPlannerTaskView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 02/03/22.
//

import SwiftUI
import CoreData

struct ShowPlannerTaskView: View {
    
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<PlannerOperation>
    
    var Title: String
    var Description: String
    var Iden: NSManagedObjectID
    
    init(Title: String, Description: String, Iden: NSManagedObjectID) {
        self.Title = Title
        self.Description = Description
        self.Iden = Iden

    }
    
    
    var body: some View {
        VStack{
            
            ForEach(operations) { operation in
                if (Iden == operation.objectID)
                {
                    Text("Hello World")
                    
                    Text("\(Title)")
                    Text("\(Description)")
                    Button{
                        add.delete(operation)
                        PlannerView()
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

//struct ShowPlannerTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowPlannerTaskView(Title: "Ciao", Description: "Ciao Description", Iden: )
//    }
//}

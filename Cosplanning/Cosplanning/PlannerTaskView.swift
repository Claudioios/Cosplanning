//
//  PlannerTaskView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 16/02/22.
//

import SwiftUI
import CoreData

struct PlannerTaskView: View {
    
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
        NavigationLink(destination: ShowPlannerTaskView(Title: Title, Description: Description, Iden: Iden)){
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
                        HStack{
                            Text("\(Description)")
                                .font(.title3)
                                .fontWeight(.regular)
                                .foregroundColor(Color("WhiteBlack"))
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
//struct PlannerTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlannerTaskView(Title: "Title", Description: "Description", Iden:)
//    }
//}

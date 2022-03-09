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
                                    Text("\(Description)")
                                        .foregroundColor(Color("WhiteBlack"))
                                }
                            }
                        }
                        Button{
                            add.delete(operation)
                            try? add.save()
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
                    Spacer()
                }
                
            }
            .padding()
        }
        .background(Image("Background"))
    }
}

//struct ShowPlannerTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowPlannerTaskView(Title: "Ciao", Description: "Ciao Description", Iden: )
//    }
//}

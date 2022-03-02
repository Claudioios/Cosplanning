//
//  PlannerTaskView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 16/02/22.
//

import SwiftUI

struct PlannerTaskView: View {
    
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<PlannerOperation>
    
    var Title: String
    var Description: String
    
    init(Title: String, Description: String) {
        self.Title = Title
        self.Description = Description
    }
    
    var body: some View {
        NavigationLink(destination: ShowPlannerTaskView()){
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
                            .foregroundColor(.white)
                            .padding(.top, 30.0)
                            .padding(.leading, 50.0)
                        Spacer()
                    }
                    HStack{
                        Text("\(Description)")
                            .font(.title3)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
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
struct PlannerTaskView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerTaskView(Title: "Title", Description: "Description")
    }
}

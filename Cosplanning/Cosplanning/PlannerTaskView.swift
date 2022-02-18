//
//  PlannerTaskView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 16/02/22.
//

import SwiftUI

struct PlannerTaskView: View {
    
    @ObservedObject var ArrayPlannerModel: ArrayPlannerModel

    var ind: Int

    init(ind: Int, ArrayPlannerModel: ArrayPlannerModel) {
        self.ind = ind
        self.ArrayPlannerModel = ArrayPlannerModel
    }
    
    var body: some View {
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
                        Text("\(ArrayPlannerModel.ArrayPlannerOperations[ind].Title)")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("ViolaBottoneChiaro"))
                            .padding(.top, 30.0)
                            .padding(.leading, 50.0)
                        Spacer()
                    }
                    HStack{
                        Text("\(ArrayPlannerModel.ArrayPlannerOperations[ind].Description)")
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

struct PlannerTaskView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerTaskView(ind: .init(), ArrayPlannerModel: .init())
    }
}

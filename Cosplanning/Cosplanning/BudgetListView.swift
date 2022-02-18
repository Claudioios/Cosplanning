//
//  BudgetListView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 11/02/22.
//

import SwiftUI

struct BudgetListView: View {
    
    @State private var Money = 500
    @State private var Positive = true
    
    @ObservedObject var ArrayBudgetOperations: ArrayModel

    var ind: Int

    init(ind: Int, ArrayBudgetOperations: ArrayModel) {
        self.ind = ind
        self.ArrayBudgetOperations = ArrayBudgetOperations
    }
    
    var body: some View {
//        Rectangle()
//            .frame(width: .infinity, height: 55)
//            .border(Color.gray)
//            .foregroundColor(.white)
//            .overlay()
//                {
//                    HStack{
//                        Text("Operation 1")
//                            .padding()
//                        Spacer()
//                        Text("50$")
//                            .foregroundColor(.green)
//                            .padding()
//                    }
//                }
        HStack
        {
            Rectangle()
                .frame(width: 350, height: 75)
                .opacity(0)
                .overlay()
            {
                if(Positive)
                {
                    HStack
                    {
                        Text("+ \(ArrayBudgetOperations.ArrayBudgetOperations[ind].Money, specifier: "%.2f") $")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .padding([.top, .leading, .bottom])
                        Spacer()
                        Text("\(ArrayBudgetOperations.ArrayBudgetOperations[ind].Description)")
                            .lineLimit(1)
                            .padding(.vertical)
                        Spacer()
                        Text("\(ArrayBudgetOperations.ArrayBudgetOperations[ind].Date)")
                            .padding([.top, .bottom, .trailing])
                    }
                }
                else
                {
                    HStack
                    {
                        Text("- \(ArrayBudgetOperations.ArrayBudgetOperations[ind].Money) $")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .padding([.top, .leading, .bottom])
                        Spacer()
                        Text("\(ArrayBudgetOperations.ArrayBudgetOperations[ind].Description)")
                            .lineLimit(1)
                            .padding(.vertical)
                        Spacer()
                        Text("\(ArrayBudgetOperations.ArrayBudgetOperations[ind].Date)")
                            .padding([.top, .bottom, .trailing])
                    }
                }
            }
        }
    }
}

struct BudgetListView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetListView(ind: .init(), ArrayBudgetOperations: .init())
    }
}

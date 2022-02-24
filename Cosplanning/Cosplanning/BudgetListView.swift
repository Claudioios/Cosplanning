//
//  BudgetListView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 11/02/22.
//

import SwiftUI

struct BudgetListView: View {
    
    @State private var Positive = true
        
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<BudgetOperation>
    
    var Money: Double
    var Description: String
    var date: Date
    init(Money: Double, Description: String, date:Date) {
        self.Money = Money
        self.Description = Description
        self.date = date
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
                        Text("\(Money, specifier: "%.2f") ")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .padding([.top, .leading, .bottom])
                        Spacer()
                        Text("\(Description)")
                            .lineLimit(1)
                            .padding(.vertical)
                        Spacer()
                        Text("\(date)")
                            .padding([.top, .bottom, .trailing])
                    }
                }
                else
                {
                    HStack
                    {
                        Text("\(Money, specifier: "%.2f")")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .padding([.top, .leading, .bottom])
                        Spacer()
                        Text("\(Description)")
                            .lineLimit(1)
                            .padding(.vertical)
                        Spacer()
                        Text("\(date)")
                            .padding([.top, .bottom, .trailing])
                    }
                }
            }
        }
    }
}

struct BudgetListView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetListView(Money: 10, Description: "Ciao", date: Date.now)
    }
}

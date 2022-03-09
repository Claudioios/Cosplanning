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
    var typeOperation: String
    init(Money: Double, Description: String, date: Date, typeOperation: String) {
        self.Money = Money
        self.Description = Description
        self.date = date
        self.typeOperation = typeOperation
    }
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: 350, height: 75)
                .opacity(0)
                .overlay()
            {
                if(typeOperation == "Add")
                {
                    HStack
                    {
                        Text("+ \(Money, specifier: "%.2f") $")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color(UIColor.systemGreen))
                            .padding([.top, .leading, .bottom])
                        Spacer()
                        Text("\(Description)")
                            .lineLimit(1)
                            .padding(.vertical)
                        Spacer()
                        Text("\(date, format: .dateTime.day().month().year())")
                            .padding([.top, .bottom, .trailing])
                    }
                }
                else
                {
                    HStack
                    {
                        Text("- \(Money, specifier: "%.2f") $")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color(UIColor.systemRed))
                            .padding([.top, .leading, .bottom])
                        Spacer()
                        Text("\(Description)")
                            .lineLimit(1)
                            .padding(.vertical)
                        Spacer()
                        Text("\(date, format: .dateTime.day().month().year())")
                            .padding([.top, .bottom, .trailing])
                    }
                }
            }
        }
    }
}

struct BudgetListView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetListView(Money: 10, Description: "Ciao", date: Date.now, typeOperation: "Add")
    }
}

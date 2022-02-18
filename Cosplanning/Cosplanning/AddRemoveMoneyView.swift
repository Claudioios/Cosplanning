//
//  AddRemoveMoneyView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 15/02/22.
//

import SwiftUI

struct AddRemoveMoneyView: View {
    
    @State private var Money: String = ""
    @State private var Description: String = ""
    @State private var date = Date()
    @Environment(\.dismiss) var dismiss
    @ObservedObject var ArrayBudgetOperations: ArrayModel
    
    var body: some View {
            VStack{
                HStack{
                    Text("Money")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    TextField(
                        "",
                        text: $Money
                    )
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                }
                HStack{
                    Text("Short Description")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    TextField(
                        "",
                        text: $Description
                    )
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                }
                HStack{
                    Text("Date")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    DatePicker(
                        "Select Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                        .datePickerStyle(CompactDatePickerStyle())
                        .padding()
                    
                }
            Spacer()
                Button{
                    ArrayBudgetOperations.ArrayBudgetOperations.append(BudgetModel(Money: Double(Money)!, Description: Description, Date: date))
                    dismiss()
                    
                }
            label:
                {
                    Image(systemName: "checkmark")
                        .frame(width: 125)
                        .padding()
                        .foregroundColor(Color(.white))
                        .background(Color("ViolaBottone"))
                        .clipShape(Capsule())
                }
                
            }
        .padding()
        .background(Image("Background"))
    
    }
}

struct AddRemoveMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        AddRemoveMoneyView(ArrayBudgetOperations: .init())
    }
}

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
    @State var selectedOperation = "Add"
    @Environment(\.dismiss) var dismiss

    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<BudgetOperation>
    
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
                HStack{
                    Spacer()
                    if (selectedOperation == "Add"){
                        Button{
                            selectedOperation = "Add"
                        }
                    label:
                        {
                            Text("Add")
                                .frame(width: 100)
                                .padding()
                                .foregroundColor(Color(.white))
                                .background(Color(UIColor.systemGreen))
                                .clipShape(Capsule())
                        }
                    }
                    else{
                        Button{
                            selectedOperation = "Add"
                        }
                    label:
                        {
                            Text("Add")
                                .frame(width: 100)
                                .padding()
                                .foregroundColor(Color(.white))
                                .background(Color(UIColor.systemGray3))
                                .clipShape(Capsule())
                        }
                    }
                    Spacer()
                    if (selectedOperation == "Remove"){
                        Button{
                            selectedOperation = "Remove"
                        }
                    label:
                        {
                            Text("Remove")
                                .frame(width: 100)
                                .padding()
                                .foregroundColor(Color(.white))
                                .background(Color(UIColor.systemRed))
                                .clipShape(Capsule())
                        }
                    }
                    else{
                        Button{
                            selectedOperation = "Remove"
                        }
                    label:
                        {
                            Text("Remove")
                                .frame(width: 100)
                                .padding()
                                .foregroundColor(Color(.white))
                                .background(Color(UIColor.systemGray3))
                                .clipShape(Capsule())
                        }
                    }
                    Spacer()
                }
            Spacer()
                Button{
                    
                    
                    let NewOperation = BudgetOperation(context: add)
                    NewOperation.money = Double(Money) ?? 0
                    NewOperation.shortdescription = Description
                    NewOperation.date = date
                    NewOperation.typeOperation = selectedOperation
                    // more code to come
                    
                    try? add.save()
                    
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
        AddRemoveMoneyView()
    }
}

//
//  AddRemoveMoneyView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 15/02/22.
//

import SwiftUI

struct AddRemoveMoneyView: View {
    
    let MoneyLoc = NSLocalizedString("Money", comment: "Money")
    let ShortDescription = NSLocalizedString("ShortDescription", comment: "ShortDescritpion")
    let DateLoc = NSLocalizedString("Date", comment: "Date")
    let SelectDate = NSLocalizedString("SelectDate", comment: "SelectDate")
    let AddLoc = NSLocalizedString("Add", comment: "Add")
    let RemoveLoc = NSLocalizedString("Remove", comment: "Remove")
    
    @State private var Money: String = ""
    @State private var Description: String = ""
    @State private var date = Date()
    @State var selectedOperation = "Add"
    @Binding var money: Double
    @Environment(\.dismiss) var dismiss

    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<BudgetOperation>
    
    var body: some View {
            VStack{
                HStack{
                    Text("\(MoneyLoc)")
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
                    Text("\(ShortDescription)")
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
                    Text("\(DateLoc)")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    Spacer()
                }
                HStack{
                    DatePicker(
                        "\(SelectDate)",
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
                            Text("\(AddLoc)")
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
                            Text("\(AddLoc)")
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
                            Text("\(RemoveLoc)")
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
                            Text("\(RemoveLoc)")
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
                    
                    if (NewOperation.typeOperation == "Add")
                    {
                        money = money + Double(Money)!
                    }
                    else
                    {
                        money = money - Double(Money)!
                    }
                     
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
        .onTapGesture {
            dismissKeyboard()
        }
    
    }
}

//extension View {
//    func dismissKeyboard(){
//        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
//    }
//}

//struct AddRemoveMoneyView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddRemoveMoneyView(money: 0.0)
//    }
//}

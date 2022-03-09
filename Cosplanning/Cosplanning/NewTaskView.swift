//
//  NewTaskView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 16/02/22.
//

import SwiftUI

struct NewTaskView: View {
    
    let TitleLoc = NSLocalizedString("Title", comment: "Title")
    let DescriptionLoc = NSLocalizedString("Description", comment: "Description")
    let SelectDate = NSLocalizedString("SelectDate", comment: "SelectDate")
    
    @State private var Title: String = ""
    @State private var Description: String = ""
    //    @State private var Material: String = ""
    
    @State private var date = Date()
    
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) var add
    @FetchRequest(sortDescriptors: []) var operations: FetchedResults<PlannerOperation>
    
    var body: some View {
        VStack{
            HStack{
                
                Text("\(TitleLoc)")
                    .font(.title)
                    .fontWeight(.regular)
                    .padding()
                Spacer()
            }
            HStack{
                TextField(
                    "",
                    text: $Title
                )
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
            }
            HStack{
                Text("\(DescriptionLoc)")
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
                DatePicker(
                    "\(SelectDate)",
                    selection: $date,
                    //                    in: dateRange,
                    displayedComponents: [.date]
                )
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding()
            }
            Spacer()
            
            Button{
                
                let NewOperation = PlannerOperation(context: add)
                NewOperation.title = Title
                NewOperation.titledescription = Description
                NewOperation.date = date
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
        .onTapGesture {
            dismissKeyboard()
        }
    }
    
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}

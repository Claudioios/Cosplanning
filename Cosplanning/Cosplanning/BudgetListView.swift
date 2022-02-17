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
            if(Positive)
            {
            Text("+ \(Money) $")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.green)
                .padding()
            }
            else
            {
                Text("- \(Money) $")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}

struct BudgetListView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetListView()
    }
}

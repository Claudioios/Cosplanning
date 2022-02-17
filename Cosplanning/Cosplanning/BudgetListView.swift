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
            Rectangle()
                .frame(width: 350, height: 75)
                .opacity(0)
                .overlay()
            {
                if(Positive)
                {
                    HStack
                    {
                        Text("+ \(Money) $")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .padding([.top, .leading, .bottom])
                        Spacer()
                        Text("Testo esempio")
                            .lineLimit(1)
                            .padding(.vertical)
                        Spacer()
                        Text("15/02/2022")
                            .padding([.top, .bottom, .trailing])
                    }
                }
                else
                {
                    HStack
                    {
                        Text("- \(Money) $")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .padding()
                        Spacer()
                        Text("Testo esempio")
                            .lineLimit(1)
                            .padding(.vertical)
                        Spacer()
                        Text("15/02/2022")
                            .padding([.top, .bottom, .trailing])
                    }
                }
            }
        }
    }
}

struct BudgetListView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetListView()
    }
}

//
//  BudgetView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI

struct BudgetView: View {
    
    @State private var showingSheet = false
    @State private var money = 100.00

    var body: some View {
        NavigationView{
            ScrollView()
            {
                VStack{
                    Rectangle()
                        .frame(width: 350, height: 200)
                        .cornerRadius(43)
                        .foregroundColor(Color("Giallo"))
                        .padding()
                        .overlay()
                    {

                            Text("\(money, specifier: "%.2f")$")
                            .font(.largeTitle)
                                .padding()


                    }
                    HStack{
                        HStack{
                            Spacer()
                            Button{showingSheet.toggle()}
                        label:
                            {
                                Text("Add Money")
                                    .frame(width: 125)
                                    .padding()
                                    .foregroundColor(Color(.white))
                                    .background(Color("ViolaBottone"))
                                    .clipShape(Capsule())
                                    .shadow(color: Color.gray, radius: 5, x: -2, y: -2)
                            }
                            .sheet(isPresented: $showingSheet) {
                                        AddRemoveMoneyView()
                                    }
                            Spacer()
                        }
                        Spacer()

                        HStack{
                            Spacer()

                            Button{showingSheet.toggle()}
                        label:
                            {
                                Text("Remove Money")
                                    .frame(width: 125)
                                    .padding()
                                    .foregroundColor(Color(.white))
                                    .background(Color("ViolaBottone"))
                                    .clipShape(Capsule())
                                    .shadow(color: Color.gray, radius: 5, x: -2, y: -2)
                                
                            }
                            .sheet(isPresented: $showingSheet) {
                                        AddRemoveMoneyView()
                                    }
                            Spacer()

                        }
                }
                    
                    BudgetListView()
                    BudgetListView()
                    BudgetListView()
                    BudgetListView()

            }
            .navigationTitle("Budget")
        }

        }
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}

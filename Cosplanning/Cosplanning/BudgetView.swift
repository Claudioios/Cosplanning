//
//  BudgetView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI

struct BudgetView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            ScrollView()
            {
                VStack{
                    Rectangle()
                        .frame(width: 350, height: 200)
                        .cornerRadius(43)
                        .foregroundColor(.blue)
                        .padding()
                        .overlay()
                    {
                        Rectangle()
                            .frame(width: 250, height: 120)
                            .cornerRadius(40)
                            .foregroundColor(.cyan)
                            .padding()
                            .overlay()
                        {
                            Text("100,20$")
                                .font(.largeTitle)
                                .padding()
                                
                        }

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

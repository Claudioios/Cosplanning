//
//  BudgetView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI

struct BudgetView: View {
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
                    Divider()
                    HStack{
                        HStack{
                            Spacer()
                            Button{}
                        label:
                            {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding()
                                
                            }
                            Spacer()
                        }
//                        Spacer()
                        Divider()

                        HStack{
                            Spacer()

                            Button{}
                        label:
                            {
                                Image(systemName: "minus.circle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding()
                                
                            }
                            Spacer()

                        }
                }
                    Divider()
                    
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

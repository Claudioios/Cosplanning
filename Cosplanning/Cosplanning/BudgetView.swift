//
//  BudgetView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI

struct BudgetView: View {
    
    @State private var showingAddRemove = false
    @State private var money = 100.00
    @State private var x = 500


    var body: some View {
        NavigationView{
            VStack{
            Rectangle()
                    .frame(width: .infinity, height: 50).ignoresSafeArea( edges: .top)
                .foregroundColor(Color("ViolaBottoneChiaro"))
               
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
                            Button{showingAddRemove.toggle()}
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
                            .sheet(isPresented: $showingAddRemove) {
                                        AddRemoveMoneyView()
                                    }
                            Spacer()
                        }
                        Spacer()

                        HStack{
                            Spacer()

                            Button{showingAddRemove.toggle()}
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
                            .sheet(isPresented: $showingAddRemove) {
                                        AddRemoveMoneyView()
                                    }
                            Spacer()

                        }
                }
                    VStack{
                        Rectangle()
                            .frame(width: 350, height: CGFloat(x))
                            .cornerRadius(43)
                            .padding()
                            .overlay()
                            {
                                VStack{
                                BudgetListView()
                                BudgetListView()
                                BudgetListView()
                                    Spacer()
                                }
                            }
                        
                    }
                    

            }
            .navigationTitle("Budget")
            .background(Image("Background"))
        }

        }
    }
}
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}

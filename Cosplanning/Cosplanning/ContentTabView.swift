//
//  ContentTabView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 08/02/22.
//

import SwiftUI

struct ContentTabView: View {

    @StateObject private var dataController = DataController()

    var body: some View {
        TabView {
            
            PlannerView()
//                .overlay(alignment: .top, content: {
//                    Color.clear // Or any view or color
//                        .background(Color("ViolaBottoneChiaro")) // I put clear here because I prefer to put a blur in this case. This modifier and the material it contains are optional.
//                .edgesIgnoringSafeArea(.top)
//                .frame(height: 0) // This will constrain the overlay to only go above the top safe area and not under.
//                })
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Planner")
                }
                .environment(\.managedObjectContext, dataController.container.viewContext)

            
            
            ProjectView()
//                .overlay(alignment: .top, content: {
//                    Color.clear // Or any view or color
//                        .background(Color("ViolaBottoneChiaro")) // I put clear here because I prefer to put a blur in this case. This modifier and the material it contains are optional.
//                .edgesIgnoringSafeArea(.top)
//                .frame(height: 0) // This will constrain the overlay to only go above the top safe area and not under.
//                })
                .tabItem {
                    Image(systemName: "pencil.circle")
                    Text("Projects")
                }
                .environment(\.managedObjectContext, dataController.container.viewContext)

            
            
            BudgetView()
//                .overlay(alignment: .top, content: {
//                    Color.clear // Or any view or color
//                        .background(Color("ViolaBottoneChiaro")) // I put clear here because I prefer to put a blur in this case. This modifier and the material it contains are optional.
//                .edgesIgnoringSafeArea(.top)
//                .frame(height: 0) // This will constrain the overlay to only go above the top safe area and not under.
//                })
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Budget")
                }
                .environment(\.managedObjectContext, dataController.container.viewContext)

            
            
            InventoryView()
//                .overlay(alignment: .top, content: {
//                    Color.clear // Or any view or color
//                        .background(Color("ViolaBottoneChiaro")) // I put clear here because I prefer to put a blur in this case. This modifier and the material it contains are optional.
//                .edgesIgnoringSafeArea(.top)
//                .frame(height: 0) // This will constrain the overlay to only go above the top safe area and not under.
//                })
                .tabItem {
                    Image(systemName: "shippingbox")
                    Text("Inventory")
                }
                .environment(\.managedObjectContext, dataController.container.viewContext)

            

        }
        
        .accentColor(Color.indigo)
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor(Color("WhiteBlack"))
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        }
    }
}

extension View {
    func dismissKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView()
    }
}

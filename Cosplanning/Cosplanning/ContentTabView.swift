//
//  ContentTabView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 08/02/22.
//

import SwiftUI

struct ContentTabView: View {
    
    @StateObject var ArrayBudgetOperations = ArrayModel()
    @StateObject var ArrayPlannerOperations = ArrayPlannerModel()
    @StateObject var ArrayInventoryOperations = ArrayInventoryModel()

    @StateObject private var dataController = DataController()

    var body: some View {
        TabView {
            
            PlannerView(ArrayPlannerModel: ArrayPlannerOperations)
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
            
            
            ProjectView()
//                .overlay(alignment: .top, content: {
//                    Color.clear // Or any view or color
//                        .background(Color("ViolaBottoneChiaro")) // I put clear here because I prefer to put a blur in this case. This modifier and the material it contains are optional.
//                .edgesIgnoringSafeArea(.top)
//                .frame(height: 0) // This will constrain the overlay to only go above the top safe area and not under.
//                })
                .tabItem {
                    Image("icon")
                    Text("Projects")
                }
            
            InventoryView(ArrayInventoryOperations: ArrayInventoryOperations)
//                .overlay(alignment: .top, content: {
//                    Color.clear // Or any view or color
//                        .background(Color("ViolaBottoneChiaro")) // I put clear here because I prefer to put a blur in this case. This modifier and the material it contains are optional.
//                .edgesIgnoringSafeArea(.top)
//                .frame(height: 0) // This will constrain the overlay to only go above the top safe area and not under.
//                })
                .tabItem {
                    Image(systemName: "archivebox")
                    Text("Inventory")
                }
            
            BudgetView()
//                .overlay(alignment: .top, content: {
//                    Color.clear // Or any view or color
//                        .background(Color("ViolaBottoneChiaro")) // I put clear here because I prefer to put a blur in this case. This modifier and the material it contains are optional.
//                .edgesIgnoringSafeArea(.top)
//                .frame(height: 0) // This will constrain the overlay to only go above the top safe area and not under.
//                })
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Budget")
                }
                .environment(\.managedObjectContext, dataController.container.viewContext)

        }
        
        .accentColor(Color.indigo)
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor.white
            
            
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView()
    }
}

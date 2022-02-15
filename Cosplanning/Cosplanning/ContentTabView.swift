//
//  ContentTabView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 08/02/22.
//

import SwiftUI

struct ContentTabView: View {
    var body: some View {
        TabView {
            
            PlannerView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Planner")
                }
            
            ProjectView()
                .tabItem {
                    Image("icon")
                    Text("Projects")
                }
            
            InventoryView()
                .tabItem {
                    Image(systemName: "archivebox")
                    Text("Inventory")
                }
            
            BudgetView()
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Budget")
                }
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

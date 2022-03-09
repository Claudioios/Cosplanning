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
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Planner")
                }
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
            
            
            ProjectView()
                .tabItem {
                    Image(systemName: "pencil.circle")
                    Text("Projects")
                }
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
            
            
            BudgetView()
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Budget")
                }
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
            
            
            InventoryView()
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

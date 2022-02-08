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
              Image(systemName: "list.bullet.rectangle.portrait")
              Text("Planner")
            }
          
          InventoryView()
            .tabItem {
              Image(systemName: "plus.circle.fill")
              Text("Inventory")
            }
          
          ProfileView()
            .tabItem {
              Image(systemName: "brain.head.profile")
              Text("Profile")
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

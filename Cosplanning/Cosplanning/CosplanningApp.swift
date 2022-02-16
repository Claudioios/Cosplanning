//
//  CosplanningApp.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 08/02/22.
//

import SwiftUI

@main
struct CosplanningApp: App {
    
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(Color("ViolaBottoneChiaro"))// UTILISSIMO MI HA SALVATO LA VITA
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor(Color("ViolaBottoneChiaro"))
            UINavigationBar.appearance().isTranslucent = true
           }
        
    var body: some Scene {
        WindowGroup {
            ContentTabView()
        }
    }
}

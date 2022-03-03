//
//  CosplanningApp.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 08/02/22.
//

import SwiftUI

@main
struct CosplanningApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(Color("ViolaBottoneChiaro"))// UTILISSIMO MI HA SALVATO LA VITA
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("WhiteBlack"))]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("WhiteBlack"))]
        UINavigationBar.appearance().barTintColor = UIColor(Color("ViolaBottoneChiaro"))
            UINavigationBar.appearance().isTranslucent = true
        
    }
        
    var body: some Scene {
        WindowGroup {
            ContentTabView()
        }
    }
}

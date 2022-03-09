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
    class AppDelegate: NSObject, UIApplicationDelegate {
        
        static var orientationLock = UIInterfaceOrientationMask.all //By default you want all your views to rotate freely
        
        func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
            return AppDelegate.orientationLock
        }
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentTabView()
                .onAppear {
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                    AppDelegate.orientationLock = .portrait // And making sure it stays that way
                }
        }
        
    }
}

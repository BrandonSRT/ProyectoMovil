//
//  ProyectoApp.swift
//  Proyecto
//
//  Created by user204403 on 10/14/21.
//

import SwiftUI
import Firebase

@main
struct ProyectoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SessionStore())
        }
    }
    

}

class AppDelegate : NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        print("Firebase....")
        
        return true
    }
}

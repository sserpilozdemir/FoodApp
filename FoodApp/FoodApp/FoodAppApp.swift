//
//  FoodAppApp.swift
//  FoodApp
//
//

import SwiftUI
import Firebase

@main
struct FoodAppApp: App {
    
    @StateObject var authentication = Authentication()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
                ContentView()
                    .environmentObject(authentication)
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
}

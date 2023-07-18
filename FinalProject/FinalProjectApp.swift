//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Student7 on 11/07/2023.
//

import SwiftUI
import Firebase

@main
struct FinalProjectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? =
                     nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}

//
//  EcommerceGymApplicationApp.swift
//  EcommerceGymApplication
//
//  Created by Rohit Kumar Dhaker on 04/10/22.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct EcommerceGymApplicationApp: App {
    // connecting app delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    //
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//
//  AppDelegate.swift
//  Internet
//
//  Created by Omar Nieto on 03/02/23.
//

import UIKit
import Network

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var hasInternetAccess = false
    var connetionType = ""
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let  monitor = NWPathMonitor()
        
        monitor.start(queue: DispatchQueue.global())
        monitor.pathUpdateHandler = {path in
            if path.status == .satisfied {
                self.hasInternetAccess = true
                if path.usesInterfaceType(.wifi) {
                    self.connetionType = "WIFI"
                } else {
                    self.connetionType = "No WiFi"
                }
            } else {
                self.hasInternetAccess = true
                self.connetionType = "WIFI"
            }
        }
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


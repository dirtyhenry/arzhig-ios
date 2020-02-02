//
//  AppDelegate.swift
//  arzhig-ios
//
//  Created by Mickaël Floc'hlay on 10/01/2020.
//  Copyright © 2020 mickf.net. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        #if DEBUG
        debugPrint("Home directory is: \(NSHomeDirectory())")
        #endif

        self.coordinator = AppCoordinator()
        self.coordinator?.start()
        
        return true
    }
}


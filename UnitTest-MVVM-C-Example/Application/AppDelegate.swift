//
//  AppDelegate.swift
//  UnitTest-MVVM-C-Example
//
//  Created by Serkan Kara on 14.01.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinatoring?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let nav = UINavigationController()
        self.window = setupWindow(nav)
        setupCoordinator(navController: nav)
        return true
    }

}

extension AppDelegate {
    private func setupWindow(_ nav: UINavigationController, makeKeyAndVisible: Bool = true) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.overrideUserInterfaceStyle = .light
        window.rootViewController = nav
        window.makeKeyAndVisible()
        return window
    }

    private func setupCoordinator(navController: UINavigationController) {
        coordinator = AppCoordinator(navigation: navController)
        coordinator?.start()
    }
}

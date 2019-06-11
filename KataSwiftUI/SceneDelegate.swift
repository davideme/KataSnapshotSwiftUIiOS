//
//  SceneDelegate.swift
//  KataSwiftUI
//
//  Created by Davide Mendolia on 10/06/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ServiceLocator().provideRootViewController()
        self.window = window
        configureWindow()
        configureNavigationBarStyle()
        window.makeKeyAndVisible()
    }

    fileprivate func configureWindow() {
        window?.backgroundColor = UIColor.windowBackgroundColor
    }

    fileprivate func configureNavigationBarStyle() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor.navigationBarColor
        navigationBarAppearance.tintColor = UIColor.navigationBarTitleColor
        navigationBarAppearance.isTranslucent = false
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.navigationBarTitleColor]
    }
}

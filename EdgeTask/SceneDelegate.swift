//
//  SceneDelegate.swift
//  EdgeTask
//
//  Created by Emad Habib on 14/07/2024.
//

import UIKit
import UniversityListing

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainRouter: MainRouter?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let isUnitTestRun = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
        guard let windowScene = scene as? UIWindowScene,
              !isUnitTestRun else { return }
        configureWindow(in: windowScene)
    }
    
    func configureWindow(in windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        mainRouter = MainRouter(window: window)
        mainRouter?.start()
    }
}

//
//  SceneDelegate.swift
//  Solid
//
//  Created by René Fokkema on 06/07/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	var mainController:MainViewController!

	var red: CGFloat!, green: CGFloat!, blue: CGFloat!

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		self.red = 0.0
		self.green = 128.0
		self.blue = 255.0
		
		self.mainController = (self.window!.rootViewController as! MainViewController)
		guard let _ = (scene as? UIWindowScene) else { return }
	}

	func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
		let url = URLContexts.first!.url
		if url.lastPathComponent == "wallpaper-set" && url.queryDictionary?["success"] == "true"
		{ self.mainController.showSuccessAlert() }
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {

		if let frontController = self.window!.rootViewController!.presentedViewController {
			if frontController.title == "Share"
			{ self.window!.rootViewController!.dismiss(animated: true, completion: nil) }
		}
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}
}

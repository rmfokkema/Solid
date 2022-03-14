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

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		print("- scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) \n")

		if  let query = connectionOptions.urlContexts.first?.url.query {
			print("URL query: \(query) \n\n")
		}

		self.mainController = (self.window!.rootViewController as! MainViewController)
		guard let _ = (scene as? UIWindowScene) else { return }
	}

	func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
		let url = URLContexts.first!.url
		if url.lastPathComponent == "wallpaper-set" && url.queryDictionary?["success"] == "true"
		{ self.mainController.showSuccessAlert() }
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
		print("- sceneWillEnterForeground(_ scene: UIScene) \n")
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
		print("- sceneDidBecomeActive(_ scene: UIScene) \n")

		if let frontController = self.window!.rootViewController!.presentedViewController {
			if frontController.title == "Share"
			{ self.window!.rootViewController!.dismiss(animated: true, completion: nil) }
		}
	}

	func sceneWillResignActive(_ scene: UIScene) {
		print("- sceneWillResignActive(_ scene: UIScene) \n")
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
		print("- sceneDidEnterBackground(_ scene: UIScene) \n")
	}

	func sceneDidDisconnect(_ scene: UIScene) {
		print("- sceneDidDisconnect(_ scene: UIScene) \n")
	}
}

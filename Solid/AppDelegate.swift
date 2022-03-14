//
//  AppDelegate.swift
//  Solid
//
//  Created by René Fokkema on 06/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


	//private var defaults: UserDefaults
	//private let defaults:UserDefaults
	public var red:CGFloat?, green:CGFloat?, blue:CGFloat?
//
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		print("- application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool \n")
		return true
	}

	// MARK: UISceneSession Lifecycle
	
	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		print("- application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration \n")
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}
	
	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		print("- application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) \n")
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		print("- applicationWillTerminate(_ application: UIApplication) \n")
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		print("- applicationDidEnterBackground(_ application: UIApplication) \n")
	}

	private func applicationWillResignActive(application: UIApplication) {
		print("- applicationWillResignActive(_ application: UIApplication) \n")
	}
}


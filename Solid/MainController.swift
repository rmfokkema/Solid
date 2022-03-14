//
//  MainController.swift
//  Solid
//
//  Created by René Fokkema on 17/07/2021.
//

import UIKit

class MainViewController: UITabBarController, UITabBarDelegate {

	//public var red: CGFloat!, green: CGFloat!, blue: CGFloat!
	

	override func viewDidLoad() {
		super.viewDidLoad()
	}

//	override func viewWillAppear(_ animated: Bool) {
//	}

	override func tabBar(_ tabBar: UITabBar,
						 didSelect item: UITabBarItem) {
		print("Tapped: \(item.title!) \n\n")
	}

//	optional func tabBarController(_ tabBarController: UITabBarController,
//								   didSelect viewController: UIViewController)

}

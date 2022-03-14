//
//  MainController.swift
//  Solid
//
//  Created by René Fokkema on 17/07/2021.
//
//	let banner = """
//		  __,
//		 (           o  /) _/_
//		  `.  , , , ,  //  /
//		(___)(_(_/_(_ //_ (__
//					 /)
//					(/
//		"""

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate, UIColorPickerViewControllerDelegate {

	//public var red: CGFloat!, green: CGFloat!, blue: CGFloat!

	var tintColor: UIColor!

	override func viewDidLoad() {
		super.viewDidLoad()

		self.becomeFirstResponder()
		self.delegate = self

		self.tintColor = .random
		self.tabBar.tintColor = self.tintColor

		self.tabBar.backgroundColor = .standardBackgroundColor
		self.tabBar.layer.shadowColor = UIColor.black.cgColor
		self.tabBar.layer.shadowOpacity = 0.65
		self.tabBar.layer.shadowOffset = .zero
		self.tabBar.layer.shadowRadius = 6.5
	}

	override var canBecomeFirstResponder: Bool {
		get {
			return true
		}
	}

	override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
		if motion == .motionShake {
			self.tintColor = .random

			UIView.animate(withDuration: 0.4, delay: 0.0, options:[], animations: {
				let activeController = (self.selectedViewController as! CommonController)
				activeController.view.backgroundColor = .random
				activeController.shareButton.tintColor = self.tintColor
				self.tabBar.tintColor = self.tintColor
			}, completion:nil)

		}
	}

	internal func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
		if (self.selectedViewController!.title == "Custom".localized && viewController.title == "Custom".localized) {
			self.presentColorPicker()
		}
		return true
	}

	func presentColorPicker() {
		let picker = UIColorPickerViewController()
		picker.supportsAlpha = false
		picker.selectedColor = self.selectedViewController!.view.backgroundColor!
		picker.delegate = self
		present(picker, animated: true, completion: nil)
	}

	func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
		dismiss(animated: true, completion: nil)
	}

	func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
		let color = viewController.selectedColor
		self.selectedViewController!.view.backgroundColor = color
	}

	func showSuccessAlert() {
		let lastChar1 = (Int.random(in: 0...1) == 0) ? "!" : ""
		let lastChar2 = (lastChar1 == "") ? "!" : ""

		let title = String(format: "%@%@", arguments: ["Done".localized, lastChar1])
		let message = String(format: "%@%@", arguments: ["DoneMessage".localized, lastChar2])

		Timer.doAfter(interval: 0.5, {
			Functions.showModalAlert(title, message)
		})
	}

}

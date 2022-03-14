//
//  MainController.swift
//  Solid
//
//  Created by René Fokkema on 17/07/2021.
//

import UIKit

class CommonController: UIViewController, UIColorPickerViewControllerDelegate {

	@IBOutlet weak var labelR: UILabel!
	@IBOutlet weak var labelG: UILabel!
	@IBOutlet weak var labelB: UILabel!

	@IBOutlet weak var shareButton: UIButton!

	var screenWidth, screenHeight: CGFloat!
	var red: CGFloat!, green: CGFloat!, blue: CGFloat!
	var newRed, newGreen, newBlue: CGFloat!
	private var mainController: MainViewController!

	private var sceneDelegate:SceneDelegate!

	override func viewDidLoad() {
		super.viewDidLoad()

		self.sceneDelegate = (UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate)

		self.mainController = (self.parent as! MainViewController)

		//let appDelegate = UIApplication.shared.delegate as! AppDelegate

		self.red = self.sceneDelegate.red
		self.green = self.sceneDelegate.green
		self.blue = self.sceneDelegate.blue

		screenWidth = self.view.bounds.width
		screenHeight = self.view.bounds.height

		print("\(self.title!) did load. \n")
		//print("\(self.red!), \(self.green!), \(self.blue!)")

		self.updateBackgroundColor(labels: true)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		print("\(self.title!) will appear... \n")
		self.shareButton.tintColor = self.mainController.tintColor
	}

	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)

		print("\(self.title!) will disappear... \n")
//		self.sceneDelegate.red = self.red
//		self.sceneDelegate.green = self.green
//		self.sceneDelegate.blue = self.blue
	}
	
	@IBAction @objc func chooseAndShareColor(){

		if (self is ViewController1) {
			let vc1 = self as! ViewController1
			if vc1.motionManager.isAccelerometerActive  {
				vc1.toggleMotionTracking()
			}
		}

		let alert = UIAlertController(title: "ShareTitle".localized, message: "ShareMessage".localized, preferredStyle: .actionSheet)

		alert.addAction(UIAlertAction(title: "Save".localized, style: .default, handler: { _ in
			let image = UIImage(color: self.view.backgroundColor!, size: CGSize(width: 100, height: 100))
			UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
		}))

		alert.addAction(UIAlertAction(title: "Share".localized, style: .default, handler: { _ in
			let image = UIImage(color: self.view.backgroundColor!, size: CGSize(width: 100, height: 100))
			let shareViewController : UIActivityViewController = UIActivityViewController(
				activityItems: [image!], applicationActivities: nil)

			shareViewController.excludedActivityTypes = [
				UIActivity.ActivityType.postToWeibo,
				//UIActivity.ActivityType.print,
				UIActivity.ActivityType.assignToContact,
				//UIActivity.ActivityType.saveToCameraRoll,
				UIActivity.ActivityType.addToReadingList,
				UIActivity.ActivityType.postToFlickr,
				UIActivity.ActivityType.postToVimeo,
				UIActivity.ActivityType.postToTencentWeibo,
				UIActivity.ActivityType.postToFacebook
			]

			shareViewController.title = "Share"
			self.present(shareViewController, animated: true, completion: nil)
		}))

		alert.addAction(UIAlertAction(title: "Shortcut".localized, style: .default, handler: { _ in
			let image = UIImage(color: self.view.backgroundColor!, size: CGSize(width: 1, height: 1))
			let data = image?.pngData()
			let fileStream:String = data!.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))

			let shortcut = "shortcuts://run-shortcut?name=Set%20as%20Wallpaper&input=\(fileStream)"
			let url = URL(string: shortcut)!

			UIApplication.shared.open(url,
									  options: [:],
									  completionHandler: nil)
		}))
		alert.addAction(UIAlertAction(title: "Cancel".localized, style: UIAlertAction.Style.cancel))

		self.present(alert, animated: true) {
			alert.view.superview?.isUserInteractionEnabled = true
			alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
		}
	}

	@objc func alertControllerBackgroundTapped()
	{
		self.dismiss(animated: true, completion: nil)
	}

	override var prefersStatusBarHidden: Bool {
		return true
	}

	func updateBackgroundColor(labels: Bool? = false) {
		self.view.backgroundColor = UIColor(red: self.red, green: self.green, blue: self.blue, alpha: 1.0)

	/*if (labels!) {
			self.labelR.text = String(format: "%.f", self.red * 255)
			self.labelG.text = String(format: "%.f", self.green * 255)
			self.labelB.text = String(format: "%.f", self.blue * 255)
		}
	*/
	}

	func updateBackgroundColorForBlue(labels: Bool? = false) {
		self.view.backgroundColor = UIColor(red: self.red, green: self.green, blue: self.newBlue, alpha: 1.0)
	}
}

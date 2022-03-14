//
//  AlertViewController.swift
//  Solid
//
//  Created by René Fokkema on 25/07/2021.
//

import UIKit

class AlertViewController: UIViewController {
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var messageLabel: UILabel!
	@IBOutlet weak var alertView: UIView!
	@IBOutlet weak var checkmarkImage: UIImageView!

	var message: String?

	convenience init(title: String?, message: String?) {
		self.init(nibName: "Alert", bundle: Bundle.main)
		self.title = title
		self.message = message
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.titleLabel.text = self.title
		self.messageLabel.text = self.message

		alertView.backgroundColor = UIColor.systemBackground
		checkmarkImage.tintColor = UIColor.systemBackground
		alertView.layer.cornerRadius = Constants.bigCornerRadius
		alertView.layer.shadowColor = UIColor.black.cgColor
		alertView.layer.shadowOpacity = 0.4
		alertView.layer.shadowOffset = .zero
		alertView.layer.shadowRadius = 3.0
	}

	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesEnded(touches, with: event)
		self.dismiss(animated: true, completion: nil)
	}

}

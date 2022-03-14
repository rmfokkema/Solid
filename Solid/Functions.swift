//
//  Functions.swift
//  Solid
//
//  Created by René Fokkema on 25/07/2021.
//

import UIKit

class Functions {

	class func showAlert(title: String, message: String){
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let ok = UIAlertAction(title: "OK", style: .default)
		alert.addAction(ok)
		let mainController = UIApplication.shared.windows.first!.rootViewController
		mainController?.present(alert, animated: true, completion: nil)
	}

	class func showModalAlert(_ title: String?, _ message: String?){
		let alert = AlertViewController(title: title, message: message)
		alert.modalPresentationStyle = .overFullScreen
		let mainController = UIApplication.shared.windows.first!.rootViewController
		mainController?.present(alert, animated: true, completion: nil)
	}
}

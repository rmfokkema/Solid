//
//  MotionManager.swift
//  The View
//
//  Created by René Fokkema on 06/07/2021.
//

import UIKit

extension UIColor {
	static var random: UIColor {
		return UIColor(red: .random(in: 0...1),
					   green: .random(in: 0...1),
					   blue: .random(in: 0...1),
					   alpha: 1.0)
	}
	
	var rgbComponents:(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
		var r:CGFloat = 0
		var g:CGFloat = 0
		var b:CGFloat = 0
		var a:CGFloat = 0
		if getRed(&r, green: &g, blue: &b, alpha: &a) {
			return (r,g,b,a)
		}
		return (0,0,0,0)
	}

	static var standardBackgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: Constants.alpha)

	var htmlColor:String {
		return String(format: "#%02x%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255),Int(rgbComponents.blue * 255) )
	}
}

extension UIImage {
	convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
		let rect = CGRect(origin: .zero, size: size)
		UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
		color.setFill()
		UIRectFill(rect)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		guard let cgImage = image?.cgImage else { return nil }
		self.init(cgImage: cgImage)
	}
}

extension String {
	/// Localized string for key.
	var localized: String {
		return NSLocalizedString(self, comment: "")
	}
}

extension URL {
	var queryDictionary: [String: String]? {
		guard let query = self.query else { return nil}

		var queryStrings = [String: String]()
		for pair in query.components(separatedBy: "&") {

			let key = pair.components(separatedBy: "=")[0]

			let value = pair
				.components(separatedBy:"=")[1]
				.replacingOccurrences(of: "+", with: " ")
				.removingPercentEncoding ?? ""

			queryStrings[key] = value
		}
		return queryStrings
	}
}

extension Timer {
	class func doAfter(interval: TimeInterval, _ block: @escaping () -> Void) {
		Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
			block()
		}
	}
}

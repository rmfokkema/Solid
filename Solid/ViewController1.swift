//
//  ViewController.swift
//  The View
//
//  Created by René Fokkema on 06/07/2021.
//

import UIKit
import CoreMotion
import CoreLocation

class ViewController1: CommonController, CLLocationManagerDelegate {

	private var locationManager: CLLocationManager!
	var motionManager = CMMotionManager()

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated);
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		//		self.labelR.text = String(format: "%.f", self.redValue * 255)
		//		self.labelG.text = String(format: "%.f", self.greenValue * 255)
		//		self.labelB.text = String(format: "%.f", self.blueValue * 255)
		
		self.locationManager = CLLocationManager()
		self.locationManager.delegate = self

		self.locationManager.requestWhenInUseAuthorization()
		self.locationManager.startUpdatingHeading()

		//self.toggleMotionTracking()

		self.view.backgroundColor = .random
		
		let singleTap = UITapGestureRecognizer(target: self, action:  #selector (self.toggleMotionTracking))
		singleTap.numberOfTapsRequired = 1
		self.view.addGestureRecognizer(singleTap)
	}

	internal func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {

		self.blue = CGFloat( newHeading.magneticHeading.truncatingRemainder(dividingBy: 60) / 60 )
	}

	@objc func toggleMotionTracking() {

		if !self.motionManager.isAccelerometerAvailable { return }
		self.motionManager.accelerometerUpdateInterval = 1.0 / 30.0

		if (!self.motionManager.isAccelerometerActive) {
			self.motionManager.startAccelerometerUpdates(to: OperationQueue.current!,
														 withHandler: {(data: CMAccelerometerData?, errorOC: Error?) in
															self.setRGBForMotion(data:data!)
															self.updateBackgroundColor(labels: true)
														 })
		} else {
			self.motionManager.stopAccelerometerUpdates()
		}
	}

	func setRGBForMotion(data: CMAccelerometerData?) {
		if let trueData = data {
			self.red = (trueData.acceleration.x >= -0.6 && trueData.acceleration.x <= 0.6) ? CGFloat( (trueData.acceleration.x + 0.6 ) / 1.2 ) : self.red
			if (trueData.acceleration.x < -0.5) { self.red = 0.0 }
			if (trueData.acceleration.x > 0.5) { self.red = 1.0 }

			self.green = (trueData.acceleration.y >= -0.6 && trueData.acceleration.y <= 0.6) ? CGFloat( (trueData.acceleration.y + 0.6 ) / 1.2 ) : self.green
			if (trueData.acceleration.y < -0.5) { self.green = 0.0 }
			if (trueData.acceleration.y > 0.5) { self.green = 1.0 }

		}
	}
}

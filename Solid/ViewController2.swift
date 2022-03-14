//
//  ViewController.swift
//  The View
//
//  Created by René Fokkema on 06/07/2021.
//

import UIKit

class ViewController2: CommonController {
	
	
	private var touchStart: CGPoint!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .random
		let pinchGesture = UIPinchGestureRecognizer(target: self, action:  #selector (self.adjustValueForBlue (_:)))
		self.view.addGestureRecognizer(pinchGesture)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>,
							   with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		
		let touch = touches.first!
		self.touchStart = touch.location(in: self.view)
	}
	
	
	override func touchesMoved(_ touches: Set<UITouch>,
							   with event: UIEvent?) {
		super.touchesMoved(touches, with: event)
		
		let touch = touches.first!
		let location = touch.location(in: self.view)
		let dX = ( location.x - self.touchStart.x ) / self.screenWidth
		let dY = ( self.touchStart.y - location.y ) / self.screenHeight
		
		self.newRed = self.red + dX / 4;
		if (self.newRed < 0) { self.newRed = 0 }
		if (self.newRed > 1.0) { self.newRed = 1.0 }
		self.red = newRed
		
		self.newGreen = self.green + dY / 4;
		if (self.newGreen < 0) { self.newGreen = 0 }
		if (self.newGreen > 1.0) { self.newGreen = 1.0 }
		self.green = newGreen
		
		self.updateBackgroundColor(labels: true)
	}
	
	@objc func adjustValueForBlue(_ sender:UIPinchGestureRecognizer) {
		self.newBlue = self.blue * sender.scale
		
		if (newBlue < 0.0009 ) { newBlue = 0.001 }
		if (newBlue > 1.0 ) { newBlue = 1.0 }
		
		self.updateBackgroundColorForBlue(labels: true)
		
		if sender.state == .ended { self.blue = self.newBlue }
	}
}

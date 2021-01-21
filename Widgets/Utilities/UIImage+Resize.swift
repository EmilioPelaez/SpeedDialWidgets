//
//  UIImage+Resize.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 22/01/21.
//

import UIKit

extension UIImage {
	
	func resized(toFit size: CGSize) -> UIImage? {
		let newSize = CGSize(aspectRatio: self.size.aspectRatio, maxSize: size)
		UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
		defer {
			UIGraphicsEndImageContext()
		}
		self.draw(in: CGRect(origin: .zero, size: newSize))
		guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
			assertionFailure("Unable to get image from context")
			return nil
		}
		return image
	}
	
}

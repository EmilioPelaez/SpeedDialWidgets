//
//  Connection+UI.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI

extension Connection {
	
	var image: Image {
		switch self {
		case .phone, .faceTimeAudio: return Image(systemName: "phone.fill")
		case .faceTime: return Image(systemName: "video.fill")
		case .unknown: return Image(systemName: "questionmark.circle.fill")
		}
	}
	
	var name: String {
		switch self {
		case .phone: return "Phone"
		case .faceTime: return "FaceTime"
		case .faceTimeAudio: return "Audio"
		case .unknown: return "Unknown"
		}
	}
	
}

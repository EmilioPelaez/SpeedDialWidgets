//
//  Connection+UI.swift
//  WidgetsExtension
//
//  Created by Emilio Peláez on 21/01/21.
//

import SwiftUI

extension Connection {
	
	static var call: [Connection] = [.phone, .faceTime, .faceTimeAudio]
	
	static var messaging: [Connection] = [.message, .whatsapp, .telegram]
	
	var image: Image {
		switch self {
		case .phone, .faceTimeAudio: return Image(systemName: "phone.fill")
		case .faceTime: return Image(systemName: "video.fill")
		case .message, .whatsapp: return Image(systemName: "message.fill")
		case .telegram: return Image(systemName: "paperplane.fill")
		case .unknown: return Image(systemName: "questionmark.circle.fill")
		}
	}
	
	var name: String {
		switch self {
		case .phone: return "Phone"
		case .faceTime: return "FaceTime"
		case .faceTimeAudio: return "Audio"
		case .message: return "Messages"
		case .whatsapp: return "WhatsApp"
		case .telegram: return "Telegram"
		case .unknown: return "Unknown"
		}
	}
	
	var scheme: String {
		switch self {
		case .phone: return "tel://"
		case .faceTime: return "facetime://"
		case .faceTimeAudio: return "facetime-audio://"
		case .message: return "sms://"
		case .whatsapp: return "https://wa.me/"
		case .telegram: return "tg://msg?to="
		case .unknown: return "tel://"
		}
	}
	
	var requiresOnlyNumbers: Bool {
		[.telegram, .whatsapp].contains(self)
	}
	
	func matches(_ url: URL) -> Bool {
		url.absoluteString.contains(scheme)
	}
	
}

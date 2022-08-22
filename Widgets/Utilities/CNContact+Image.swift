//
//  CNContact+Image.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 22/08/22.
//

import Contacts
import Foundation
import SwiftUI

extension CNContact {
	static func imageForContactId(_ identifier: String, imageSize: CGFloat, squared: Bool) -> Image? {
		func resized(_ image: UIImage?) -> UIImage? {
			squared ? image?.square(imageSize) : image?.resized(toFit: CGSize(side: imageSize))
		}
		do {
			let keys = [CNContactThumbnailImageDataKey].map { $0 as CNKeyDescriptor }
			let predicate: NSPredicate = CNContact.predicateForContacts(withIdentifiers: [identifier])
			let contacts = try CNContactStore().unifiedContacts(matching: predicate, keysToFetch: keys)
			guard let contact = contacts.first else { return nil }
			return contact.thumbnailImageData
				.flatMap(UIImage.init)
				.flatMap { resized($0) }
				.map(Image.init)
		} catch {
			print(error)
			return nil
		}
	}
}

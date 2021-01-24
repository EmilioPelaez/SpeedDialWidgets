//
//  TutorialView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 22/01/21.
//

import SwiftUI

struct TutorialView: View {
	var body: some View {
		NavigationView {
			ScrollView {
				VStack(alignment: .leading, spacing: 10) {
					Group {
						Text("Step 1")
						Text("On your Home Screen or the Lock Screen, tap and hold on an Icon, Widget or an empty space until you see this icon on the top left of your screen. Tap it!")
						Text("Tip: Holding on an empty space is faster!")
						Color.red.frame(height: 100)
						Divider()
					}
					
					Group {
						Text("Step 2")
						Text("Find Phone Widget in the list and tap on it.")
						Text("Tip: You can also use the search bar!")
						Color.red.frame(height: 100)
						Divider()
					}
					Group {
						Text("Step 3")
						Text("Tap Add Widget")
						Text("Tip: You can also drag the widget into your Home or Lock Screen!")
						Color.red.frame(height: 100)
						Divider()
					}
					Group {
						Text("Step 4")
						Text("If your widget is dancing, tap on it to configure it. If it's static, tap and hold, then select Edit Widget.")
						Color.red.frame(height: 100)
						Divider()
					}
					Group {
						Text("Step 5")
						Text("Configure your widget with an image size, a color, a contact and your call options.")
						Text("Tip: If the name is too long, too short, or you want to use a nickname, use the optional Alternative Name field!")
						Color.red.frame(height: 100)
						Divider()
					}
					Group {
						Text("Step 6")
						Text("Make a call!")
						Text("Your widget is ready! Now tap on it whenever you want to make a call!")
						Color.red.frame(height: 100)
					}
				}
				.padding()
				.navigationTitle("How to Use")
			}
		}
	}
}

struct TutorialView_Previews: PreviewProvider {
	static var previews: some View {
		TutorialView()
	}
}

//
//  TutorialView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 22/01/21.
//

import SwiftUI

struct TutorialView: View {
	@State var currentStep: Int = 1
	let totalSteps = 6
	
	var body: some View {
		NavigationView {
			ScrollView {
				VStack(alignment: .leading, spacing: 15) {
					Group {
						TutorialStepView(title: "Step 1",
														 content: "On your Home Screen or the Lock Screen, tap and hold on an Icon, Widget or an empty space until you see this icon on the top left of your screen. Tap it!",
														 caption: "Tip: Holding on an empty space is faster!")
						Divider()
					}
					Group {
						TutorialStepView(title: "Step 2",
														 content: "Find Phone Widget in the list and tap on it.",
														 caption: "Tip: You can also use the search bar!")
						Divider()
					}
					.transition(.slide)
					.hidden(currentStep < 2)
					Group {
						TutorialStepView(title: "Step 3",
														 content: "Tap Add Widget",
														 caption: "Tip: You can also drag the widget into your Home or Lock Screen!")
						Divider()
					}
					.transition(.slide)
					.hidden(currentStep < 3)
					Group {
						TutorialStepView(title: "Step 4",
														 content: "If your widget is dancing, tap on it to configure it. If it's static, tap and hold, then select Edit Widget.",
														 caption: nil)
						Divider()
					}
					.transition(.slide)
					.hidden(currentStep < 4)
					Group {
						TutorialStepView(title: "Step 5",
														 content: "Configure your widget with an image size, a color, a contact and your call options.",
														 caption: "Tip: If the name is too long, too short, or you want to use a nickname, use the optional Alternative Name field!")
						Divider()
					}
					.transition(.slide)
					.hidden(currentStep < 5)
					Group {
						TutorialStepView(title: "Done!",
														 content: "Your widget is ready! Now tap on it whenever you want to make a call!",
														 caption: nil)
					}
					.transition(.slide)
					.hidden(currentStep < 6)
					HStack {
						Spacer()
						Button {
							withAnimation {
								self.currentStep += 1
							}
						} label: {
							if currentStep < totalSteps - 1 {
								Text("Next Step")
							} else {
								Text("Final Step")
							}
						}
						.padding()
						Spacer()
					}
					.transition(.slide)
					.hidden(currentStep >= 6, remove: true)
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

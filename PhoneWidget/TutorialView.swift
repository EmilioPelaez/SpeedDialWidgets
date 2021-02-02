//
//  TutorialView.swift
//  PhoneWidget
//
//  Created by Emilio Peláez on 22/01/21.
//

import SwiftUI

struct TutorialView: View {
	@State var showAbout: Bool = false
	
	@State var currentStep: Int = 0
	let totalSteps = 6
	
	var body: some View {
		NavigationView {
			ScrollViewReader { scroll in
				ScrollView {
					VStack(alignment: .leading, spacing: 15) {
						Text("Thank you for installing Phone Home Widgets! All the configuration for this app is done in the Home Screen or the Lock Screen or your device. The app only holds instructions to add your widgets.")
							.font(.headline)
							.padding()
							.background(Color(.secondarySystemBackground))
							.cornerRadius(10)
							.transition(.slide)
							.hidden(currentStep > 0)
						Group {
							TutorialStepView(title: "Step 1",
															 content: "On your Home Screen or the Lock Screen, tap and hold on an Icon, Widget or an empty space until you see this icon on the top left of your screen. Tap it!",
															 caption: "Tip: Holding on an empty space is faster!",
															 image: Image("Step1"))
							Divider()
						}
						.transition(.slide)
						.hidden(currentStep < 1)
						Group {
							TutorialStepView(title: "Step 2",
															 content: "Find \"Phone Home\" in the list and tap on it.",
															 caption: "Tip: You can also use the search bar!",
															 image: Image("Step2"))
							Divider()
						}
						.transition(.slide)
						.hidden(currentStep < 2)
						Group {
							TutorialStepView(title: "Step 3",
															 content: "Tap Add Widget",
															 caption: "Tip: You can also drag the widget into your Home or Lock Screen!",
															 image: Image("Step3"))
							Divider()
						}
						.transition(.slide)
						.hidden(currentStep < 3)
						Group {
							TutorialStepView(title: "Step 4",
															 content: "If your widget is dancing, tap on it to configure it. If it's static, tap and hold, then select Edit Widget.",
															 caption: nil,
															 image: Image("Step4"))
							Divider()
						}
						.transition(.slide)
						.hidden(currentStep < 4)
						Group {
							TutorialStepView(title: "Step 5",
															 content: "Configure your widget with an image size, a color, a contact and your call options.",
															 caption: "Tip: If the name is too long, too short, or you want to use a nickname, use the optional Alternative Name field!",
															 image : Image("Step5"))
							Divider()
						}
						.transition(.slide)
						.hidden(currentStep < 5)
						Group {
							TutorialStepView(title: "Done!",
															 content: "Your widget is ready! Now tap on it whenever you want to make a call!",
															 caption: nil,
															 image: Image("Step6"))
						}
						.transition(.slide)
						.hidden(currentStep < 6)
						HStack {
							Spacer()
							Button {
								withAnimation(Animation.easeInOut(duration: 0.15)) {
									self.currentStep += 1
									DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
										withAnimation {
											scroll.scrollTo("Bottom")
										}
									}
								}
							} label: {
								Text(buttonTitle)
									.font(.headline)
									.foregroundColor(Color(.systemBackground))
									.padding()
									.padding(.horizontal)
									.background(Color.primary)
									.cornerRadius(150)
							}
							.padding()
							Spacer()
						}
						.transition(.slide)
						.hidden(currentStep >= 6, remove: true)
						Spacer()
							.id("Bottom")
					}
					.padding()
					.navigationTitle("How to Use")
					.navigationBarItems(leading:
																Button {
																	self.showAbout = true
																} label: {
																	Image(systemName: "info.circle.fill")
																		.font(.title2)
																}
					)
					.sheet(isPresented: $showAbout) {
						AboutView(showAbout: $showAbout)
					}
				}
			}
		}
	}
	
	var buttonTitle: String {
		switch currentStep {
		case 0: return "Get Started"
		case 1..<totalSteps - 1: return "Next Step"
		case _: return "Final Step"
		}
	}
}

struct TutorialView_Previews: PreviewProvider {
	static var previews: some View {
		TutorialView()
	}
}

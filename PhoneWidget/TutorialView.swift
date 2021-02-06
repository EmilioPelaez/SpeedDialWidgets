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
						Text("Thank you for installing Speed Dial Widgets! All the configuration for the widgets provided by this app is done from the Home Screen or the Lock Screen of your device. The app only holds instructions to add your widgets.")
							.font(.headline)
							.padding()
							.background(Color(.secondarySystemBackground))
							.cornerRadius(10)
							.transition(.slide)
							.hidden(currentStep > 0)
						Group {
							TutorialStepView(title: Text("Step 1"),
															 content: Text("On your Home Screen or the Lock Screen, tap and hold on an Icon, Widget or an empty space until you see this icon on the top left of your screen. Tap it!"),
															 caption: Text("Tip: Holding on an empty space is faster!"),
															 image: Image("Step1"))
							Divider()
						}
						.transition(.slide)
						.hidden(currentStep < 1)
						Group {
							TutorialStepView(title: Text("Step 2"),
															 content: Text("Find \"Speed Dial\" in the list and tap on it."),
															 caption: Text("Tip: You can also use the search bar!"),
															 image: Image("Step2"))
							Divider()
						}
						.transition(.slide)
						.hidden(currentStep < 2)
						Group {
							TutorialStepView(title: Text("Step 3"),
															 content: Text("Tap Add Widget"),
															 caption: Text("Tip: You can also drag the widget into your Home or Lock Screen!"),
															 image: Image("Step3"))
							Divider()
						}
						.transition(.slide)
						.hidden(currentStep < 3)
						Group {
							TutorialStepView(title: Text("Step 4"),
															 content: Text("If your widget is dancing, tap on it to configure it. If it's static, tap and hold, then select Edit Widget."),
															 caption: nil,
															 image: Image("Step4"))
							Divider()
						}
						.transition(.slide)
						.hidden(currentStep < 4)
						Group {
							TutorialStepView(title: Text("Step 5"),
															 content: Text("Configure your widget with an image size, a color, a contact and your call options."),
															 caption: Text("Tip: If the name is too long, too short, or you want to use a nickname, use the optional Alternative Name field!"),
															 image : Image("Step5"))
							Divider()
						}
						.transition(.slide)
						.hidden(currentStep < 5)
						Group {
							TutorialStepView(title: Text("Done!"),
															 content: Text("Your widget is ready! Now tap on it whenever you want to make a call!"),
															 caption: nil,
															 image: Image("Step6"))
						}
						.transition(.slide)
						.hidden(currentStep < 6)
						HStack {
							Spacer()
							Button {
								withAnimation(Animation.easeInOut(duration: 0.15)) {
									if self.currentStep < totalSteps {
										self.currentStep += 1
									} else {
										self.currentStep = 0
									}
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
		case totalSteps - 1: return "Final Step"
		case _: return "Start Over"
		}
	}
}

struct TutorialView_Previews: PreviewProvider {
	static var previews: some View {
		TutorialView()
	}
}

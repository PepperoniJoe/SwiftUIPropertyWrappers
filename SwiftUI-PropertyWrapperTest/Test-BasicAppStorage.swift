//
//  Test-BasicAppStorage.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/8/23.
//


import SwiftUI


///
/// @AppStorage to persistently store dark mode preference
///
struct TestBasicAppStorageView: View {

	@AppStorage("preferDark") var preferDark: Bool = false

	var body: some View {
		ZStack {
			Color(preferDark ? .black : .white)
				.edgesIgnoringSafeArea(.all)
			VStack {
				
				Text("@AppStorage")
					.foregroundColor(preferDark ? .white : .black)
					.font(.title)
				Text("used as a wrapper for UserDefaults")
					.foregroundColor(preferDark ? .white : .black)
					.font(.caption)
				
				
				Spacer()
				
				VStack {
					if preferDark == true {
						Rectangle()
							.strokeBorder(Color.white,lineWidth: 2)
							.background(Circle().foregroundColor(Color.black))
							.frame(width: 200, height: 200)
					} else {
						Circle()
							.strokeBorder(Color.black,lineWidth: 2)
							.background(Circle().foregroundColor(Color.white))
							.frame(width: 200)
					}
				}
					.frame(width: 300, height: 300)
				HStack {
					Toggle(isOn: $preferDark) {
						Text("Dark Mode")
							.frame(maxWidth: .infinity, alignment: .trailing)
					}
					.frame(maxWidth: 150, alignment: .center)
					.foregroundColor(preferDark ? .white : .black)
				}
				Text("Dark mode is currently: \(preferDark ? "Enabled" : "Disabled")")
					.padding()
					.foregroundColor(preferDark ? .white : .black)
				
				Spacer()
				
				Text("@AppStorage to persistently store dark mode preference")
					.foregroundColor(preferDark ? .white : .black)
					.font(.caption)
			}
		}
		.animation(.easeIn, value: preferDark)
	}
}


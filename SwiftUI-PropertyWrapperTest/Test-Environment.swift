//
//  Test-Environment.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/8/23.
//

import SwiftUI


struct TestEnvironmentView: View {
	@Environment(\.colorScheme) var colorScheme

	var body: some View {
		VStack {
			Text("@Environment").font(.title)
			Text("used to access environment values from the system such as locale info, color schemes, scenePhase, lineLimit, etc and any custom environment value added using info.plist. \n@Environment properties are read only.").font(.caption)
			
			Spacer()
			
			Text(colorScheme == .dark ? "Phone in dark mode" : "Phone in light mode")
			
			Spacer()
			
			Text("Change the dark/light mode to see the text change.")
				.font(.caption)
		}
	}
}

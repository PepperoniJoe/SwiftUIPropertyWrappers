//
//  Test-SceneStorage.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/8/23.
//

import SwiftUI

struct TestSceneStorageView: View {
	
	@SceneStorage("time") var time: Double?
	
	var dateString: String {
		if let timestamp = time {
			return Date(timeIntervalSince1970: timestamp).formatted()
		} else {
			return "Never"
		}
	}
	
	var body: some View {
		VStack {
			
			Text("@SceneStorage").font(.title)
			Text("used to save data persistently for each scene")
				.font(.caption)
			
			Spacer()
			
			Text("Button was last clicked on \(dateString)")
			
			Button("Click me") {
				time = Date().timeIntervalSince1970
			}
			
			Spacer()
			
			Text("Click to see the time change. Time saved persistently")
				.font(.system(size: 10))
		}
	}
}

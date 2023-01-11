//
//  TestState.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/8/23.
//

import SwiftUI

///
/// Uses @State to change items within the view
///
struct TestStateView: View {
	
	@State private var colorChange: Color = .red
	
	var body: some View {
		VStack {
			Text("@State").font(.title)
			Text("used for changes within a single view").font(.caption)
			
			Spacer()
			
			Circle()
				.fill(colorChange)
				.frame(width: 100)
				.foregroundColor(.accentColor)
			
			Text(colorChange == .red ? "Red" : "Blue")
			
			Button() {
				colorChange = colorChange == .red ? .blue : .red
			} label: {
				Text("Tap")
			}
			.padding()
			
			Spacer()
			
			Text("Uses @State to change items within the view")
				.font(.caption)
		}
	}
}

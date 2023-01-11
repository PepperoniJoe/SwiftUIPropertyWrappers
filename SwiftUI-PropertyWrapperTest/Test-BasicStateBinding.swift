//
//  Test-StateBinding.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/8/23.
//


import SwiftUI

///
/// Uses @State and @Binding to change a view from another view
///
struct TestStateBindingView: View {
	
	@State var colorChange: Color = .red
	
	var body: some View {
		VStack {
			Text("@State with @Binding").font(.title)
			Text("used to reduce a single large view using @State to several smaller views").font(.caption)
			
			Spacer()
			
			RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
				.fill(colorChange)
				.frame(width: 100, height: 200)
				.foregroundColor(.blue)
			
			Text(colorChange == .red ? "Red" : "Blue")
			
			TestStateBinding2View(colorChange: $colorChange)
			.padding()
			
			Spacer()
			
			Text("Uses @State and @Binding to change a view from another view")
				.font(.caption)
		}
	}
}


struct TestStateBinding2View: View {
	
	@Binding var colorChange: Color
	
	var body: some View {
		VStack {
			Button() {
				colorChange = colorChange == .red ? .blue : .red
			} label: {
				Text("Tap to change")
			}
		}
	}
	
}

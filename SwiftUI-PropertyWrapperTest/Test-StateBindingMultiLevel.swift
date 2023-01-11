//
//  Test-StateBindingMultiLevel.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/8/23.
//

import SwiftUI

/// Tests @State and @Bindings on a hierarchy of 3 views. The lowest view
/// can impact the middle view. The middle view impacts the top view.
///  @State and @Binding are used to make connection between two views

struct TestStateBindingMultiLevelView: View {
	
	@State var colorChange: Color = .red
	
	var body: some View {
		VStack {
			Text("@State with @Binding").font(.title)
			Text("used to reduce a single large view using @State into a hierarchy of views").font(.caption)
			
			Spacer()
			
			RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
				.fill(colorChange)
				.frame(width: 100, height: 200)
				.foregroundColor(.accentColor)
				.shadow(radius: 5.0)
			Text("Displays color associated with the selected number")
				.foregroundColor(colorChange)
			
			Spacer()
			
			TestStateBindingMultiLevel2AView(colorChange: $colorChange)
			
			Spacer()
			
			Text("@State and @Binding are used to make connections among muliple views")
				.font(.caption)
		}
	}
}


struct TestStateBindingMultiLevel2AView: View {
	
	@Binding var colorChange: Color
	@State var choice: Int = 0
	
	let choices: [Color] = [
		.red, .blue, .purple, .orange, .teal, .gray, .pink, .brown, .mint, .cyan, .yellow
	]
	
	var body: some View {
		VStack {
			Text("Number \(choice) picked")
				.foregroundColor(colorChange)

			TestStateBindingMultiLevel2A1View(choice: $choice)
		}
		.onChange(of: choice) { newValue in
			colorChange = choices[newValue]
		}
	}
}

struct TestStateBindingMultiLevel2A1View: View {
	
	@Binding var choice: Int
	
	var body: some View {
		VStack {
			Button() {
				choice = Int.random(in: 0...10)
			} label: {
				Text("Tap for another number")
			}
		}
	}
}


//struct TestStateBindingMultiLevel2BView: View {
//
//	@Binding var colorChange: Color
//
//	var body: some View {
//		VStack {
//			Button() {
//				colorChange = colorChange == .red ? .green : .red
//			} label: {
//				Text("Tap to change")
//			}
//		}
//	}
//
//}

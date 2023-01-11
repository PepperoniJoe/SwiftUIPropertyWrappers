	//
	//  Test-BiggerObservableObject.swift
	//  SwiftUI-PropertyWrapperTest
	//
	//  Created by Marcy Vernon on 1/8/23.
	//

import SwiftUI

	///
	/// Uses @StateObject with @ObservedObjects to pass data
	/// in a hierarchy of views
	///
	
	//MARK: - View Model
class TestBigVM: ObservableObject {
	@Published var myString : String = "A Big Hello World"
	@Published var color    : Color  = .teal
	@Published var shape    : Shape  = .star
}


	//MARK: - Main View
struct TestBig0View: View {
	
	@StateObject var testBigVM = TestBigVM()
	
	var body: some View {
		VStack {
			Text("@StateObject, @ObservedObject, @Published").font(.title2)
			Text("@StateObject used to organize many properties into a single object and single source of truth.\n@Published and @ObservedObjet used to access that object from other views").font(.caption)
			
			Spacer()
			
			ZStack {
				TestBig2View(testBigVM: testBigVM)
				TestBig1View(testBigVM: testBigVM)
			}
			TestBig3View(testBigVM: testBigVM)
			
			Spacer()
			
			Text("Useful for organizing many properties over many views").font(.caption)
		}
		.padding(20)
	}
}



	//MARK: - Text View
struct TestBig1View: View {
	@ObservedObject var testBigVM: TestBigVM
	
	var body: some View {
		VStack {
			Text(testBigVM.myString)
				.foregroundColor(.black)
		}
	}
}


	//MARK: - Shape View
struct TestBig2View: View {
	
	@ObservedObject var testBigVM: TestBigVM
	
	var body: some View {
		Group {
			if testBigVM.shape == .square {
				Rectangle()
					.fill(testBigVM.color)
					.frame(width: 200, height: 200)
					.padding(50)
			} else if testBigVM.shape == .circle {
				Circle()
					.fill(testBigVM.color)
					.frame(width: 300, height: 300)
			} else if testBigVM.shape == .rounded {
				RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
					.fill(testBigVM.color)
					.frame(width: 300, height: 300)
			} else if testBigVM.shape == .capsule {
				RoundedRectangle(cornerSize: CGSize(width: 75, height: 75))
					.fill(testBigVM.color)
					.frame(width: 300, height: 150)
					.padding(75)
			} else if testBigVM.shape == .rectangle {
				Rectangle()
					.fill(testBigVM.color)
					.frame(width: 300, height: 150)
					.padding(75)
			} else if testBigVM.shape == .star {
				Image(systemName: "star.fill")
					.resizable()
					.foregroundColor(testBigVM.color)
					.frame(width: 300, height: 300)
			} else if testBigVM.shape == .heart {
				Image(systemName: "heart.fill")
					.resizable()
					.foregroundColor(testBigVM.color)
					.frame(width: 300, height: 300)
			} else if testBigVM.shape == .house {
				Image(systemName: "house.fill")
					.resizable()
					.foregroundColor(testBigVM.color)
					.frame(width: 300, height: 300)
			}
		}
	}
}



	//MARK: - Buttons View
struct TestBig3View: View {
	
	@ObservedObject var testBigVM: TestBigVM
	
	let strings = ["A Big Hello World", "A Big Happy Birthday", "A Big An Apple a Day", "A Big Whatsup!", "A Big Wow! Amazing!", "A Big You re wonderful", "A Big Love Peace Charity", "A Big Fun in the sun", "A Big Time to Chill", "A Big Aussies are good dogs", "A Big Cheers!", "A Big May the Force Be With You", "A Big Live Long and Prosper", "A Big He's Dead, Jim", "A Big Scotty, beam us up"]
	
	let colors: [Color] =
	[.red, .blue, .yellow, .green, .orange, .purple, .pink, .teal, .indigo, .gray, .mint, .brown, .cyan]
	
	let shapes: [Shape] = [.square, .rectangle, .circle, .capsule, .rounded, .star, .heart, .house]
	
	var body: some View {
		HStack {
			
			Spacer()
			
			/// Text Button
			Button() {
				testBigVM.myString = strings.randomElement() ?? ""
			} label: {
				Text("Text")
			}
			
			Spacer()
			
			Button() {
				testBigVM.color = colors.randomElement() ?? .clear
			} label: {
				Text("Color")
			}
			
			Spacer()
			
			Button() {
				testBigVM.shape = shapes.randomElement() ?? .square
			} label: {
				Text("Shape")
			}
			
			Spacer()
		}
	}
}

enum Shape {
	case square
	case rectangle
	case circle
	case rounded
	case capsule
	case star
	case heart
	case house
}

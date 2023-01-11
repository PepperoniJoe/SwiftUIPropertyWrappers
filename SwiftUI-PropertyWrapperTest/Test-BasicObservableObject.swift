//
//  TestObservableObject.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/8/23.
//

import SwiftUI

///
/// An observable object is used with @Published and @EnvironmentObject
/// to read and write values across views. An .environmentObject instance is
/// placed at the top of the view hierarchy. In this case in the WindowGroup
///
//MARK: - View Model
class TestObservableObjectVM: ObservableObject {
	@Published var saying: String = "Hello World"
}


	//MARK: - Main View - Reads Observable Object
struct TestEnvironmentObjectView: View {
	
	@EnvironmentObject var testObservedObjectVM: TestObservableObjectVM
	
	var body: some View {
		VStack {
			Text("@EnvironmentObject, @Published").font(.title2)
			Text("used to share data across a view hierarchy the is more complex than two or three views. ").font(.caption)
			
			Spacer()
			
			Text(testObservedObjectVM.saying)
				.font(.largeTitle).minimumScaleFactor(0.5)
				.foregroundColor(.red)
			
			Spacer()
			
			TestObservableObject2View()
			
			Spacer()
			
			Text("An observable object is used with @Published and @EnvironmentObject to read and write values across views")
				.font(.caption)
		}
	}
}


	//MARK: - Button - Updates Observable Object
struct TestObservableObject2View: View {
	
	@EnvironmentObject var testObservedObjectVM: TestObservableObjectVM
	
	let sayings = ["Hello World", "Hold my Beer", "An Apple a Day", "Whatsup!", "Wow! Amazing!", "Once in a Blue Moon", "Love Peace Charity", "Fun in the Sun", "Time to Chill", "Boxers are Good Dogs", "Cheers!", "May the Force Be With You", "Live Long and Prosper", "He's Dead, Jim", "Beam us up, Scotty"]
	
	var body: some View {
		VStack {
			Button() {
				var randomSaying = ""

				repeat {
					randomSaying = sayings.randomElement() ?? ""
				} while randomSaying == testObservedObjectVM.saying

				testObservedObjectVM.saying = randomSaying
				
			} label: {
				Text("Tap to change")
			}
			.padding()
		}
	}
}


//
//  Test-AppStorage.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/8/23.
//


import SwiftUI


/// Main view for this section
struct TestAppStorageView: View {

	@AppStorage("preferDark") var preferDark: Bool = false
	
	var body: some View {
		ZStack {
			
			Color(preferDark ? .black : .white).edgesIgnoringSafeArea(.all)
			
			VStack {
				/// Title
				Text("@AppStorage with @Binding")
					.foregroundColor(preferDark ? .white : .black)
					.font(.title)
				Text("used to access UserDefaults from multiple views in a view hierarchy")
					.foregroundColor(preferDark ? .white : .black)
					.font(.caption)
				
				Spacer()

				ShapeView(preferDark: $preferDark)
				
				Text("Dark mode is currently: \(preferDark ? "Enabled" : "Disabled")")
					.padding()
					.foregroundColor(preferDark ? .white : .black)
				
				SetView(preferDark: $preferDark)
				
				Spacer()
				
				/// Footer
				Text("@AppStorage to persistently store dark mode preference.")
					.foregroundColor(preferDark ? .white : .black)
					.font(.caption)
			}
		}
		.animation(.easeIn, value: preferDark)
	}
}


///Reads from @AppStorage
struct ShapeView: View {
	
	@Binding var preferDark: Bool
	
	var body: some View {
		VStack {
			if preferDark == true {
				Rectangle()
					.strokeBorder(Color.white)
					.foregroundColor(Color.black)
					
			} else {
				Circle()
					.strokeBorder(Color.black)
					.foregroundColor(Color.white)
			}
		}
		.frame(width: 200, height: 200)
	}
}


/// Reads from and Writes to @AppStorage
struct SetView: View {

	@Binding var preferDark: Bool
	
	var body: some View {
		HStack {
			Toggle(isOn: $preferDark) {
				Text("Dark Mode")
					.frame(maxWidth: .infinity, alignment: .trailing)
			}
			.frame(maxWidth: 150, alignment: .center)
			.foregroundColor(preferDark ? .white : .black)
		}
	}
}





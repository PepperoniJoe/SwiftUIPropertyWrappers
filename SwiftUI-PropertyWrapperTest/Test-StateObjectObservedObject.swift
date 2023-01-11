//
//  Test-StateObjectObservedObject.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/9/23.
//


import SwiftUI

class User: ObservableObject {
	@Published var name    : String = "Major Biden"
	@Published var address : String = "1600 Pennsylvania Ave. NW"
	@Published var city		 : String = "Washington"
	@Published var state   : String = "D.C."
	@Published var zip     : String = "20500"
}


	/// Main view for this section
struct TestStateObjObsObjView: View {
	
	@StateObject var user = User()
	
	var body: some View {
		VStack {
			Text("@StateObject with @ObservedObject")
				.font(.title)
				.padding()
			Text("@StateObject used to organize many properties into a single object and single source of truth.\n@Published and @ObservedObjet used to access that object from other views").font(.caption)
			
			Spacer()
			
			ZStack {
				ZStack {
					Rectangle()
						.fill(Color.blue)
						.frame(height: 200)
					UserFieldsView(user: user)
						.foregroundColor(Color.white)
						.padding()
				}
			}
			
			Spacer()
			
			TestSOTextFieldView(user: user)
				.padding(40)
			
			Spacer()
			
			Text("The bottom fields are editable.")
				.font(.caption)
			Text("Uses @StateObject and @ObservedObject")
				.font(.caption)
		}
	}
}


	///Displays user fields
struct UserFieldsView: View {
	
	@ObservedObject var user: User
	
	var body: some View {
		VStack (alignment: .leading) {
			Text("Username: \(user.name)")
			Text("Address: \(user.address)")
			
			HStack {
				Text("City: \(user.city)")
				Text(" State: \(user.state)")
				Text(" Zip: \(user.zip)")
			}
		}
	}
}


	/// Displays and updates user fields
struct TestSOTextFieldView: View {
	
	@ObservedObject var user: User
	
	var body: some View {
		VStack (alignment: .leading) {
			TextField("Username", text: $user.name)
			TextField("Address", 	text: $user.address)
			
			HStack {
				TextField("City", 	text: $user.city)
				TextField("State", 	text: $user.state)
				TextField("Zip", 		text: $user.zip)
			}
		}
	}
}


//
//  Test-Environment-Several.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/20/23.
//


import SwiftUI

struct TestEnvironmentSeveralView: View {

	@Environment(\.description) 														var description

	var body: some View {
		VStack {
			Text("All @Environment Values").font(.title)
			Text("A description of all environment values and their current values. \n@Environment properties are read only.\nNote: If no values appear run the app again. Values only appear about 50% of the time. Report has been made to Apple").font(.caption)

			ScrollView {
				Text("\(description.replacingOccurrences(of: "EnvironmentPropertyKey<", with: "\n\nEnvironmentPropertyKey<"))").font(.caption)
			}.padding()
		}
	}
}

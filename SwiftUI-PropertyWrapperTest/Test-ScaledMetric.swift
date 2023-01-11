//
//  Test-ScaledMetric.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/9/23.
//

import SwiftUI


struct TestScaledMetricView: View {
	
	@ScaledMetric var scaledHeight: CGFloat = 50
	@ScaledMetric(relativeTo: .caption) var imageSize = 100.0
	
	var body: some View {
		VStack {
			Text("@ScaledMetric and @ScaledMetric(relativeTo:)").font(.title)
			Text("Use to scale images and other UI when dynamic text is adjusted").font(.caption)
			
			Spacer()
			RoundedRectangle(cornerRadius: 5)
				.frame(width: scaledHeight, height: scaledHeight)
				.foregroundColor(.pink)
			
			Image(systemName: "cloud.sun.bolt.fill")
				.resizable()
				.frame(width: imageSize, height: imageSize)

			Text("Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
				.font(.body)
			
			Spacer()
			
			Text("Adjust Dynamic Text to see changes")
				.font(.caption)
		}
	}
}

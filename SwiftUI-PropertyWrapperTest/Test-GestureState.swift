//
//  Test-GestureState.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/9/23.
//

import SwiftUI


struct TestGestureStateView: View {
	
	@GestureState private var dragOffset = CGSize.zero
	@GestureState private var dragAmount = CGSize.zero
	
	var body: some View {
		VStack {
			Text("@GestureState").font(.title)
			Text("used to remember the original gesture state such as the original position").font(.caption)
			
			Spacer()
			
			Image(systemName: "star.fill")
				.font(.system(size: 100))
				.offset(dragAmount)
				.foregroundColor(.teal)
				.animation(.easeInOut, value: dragAmount)
				.gesture(
					DragGesture().updating($dragAmount) { value, state, transaction in
						state = value.translation
					}
				)
			
			Spacer()
			
			Image(systemName: "circle.hexagonpath.fill")
				.font(.system(size: 100))
				.offset(x: dragOffset.width, y: dragOffset.height)
				.animation(.easeInOut, value: dragOffset)
				.foregroundColor(.pink)
				.gesture(
					DragGesture()
						.updating($dragOffset, body: { (value, state, transaction) in
							state = value.translation
						})
				)
			
			Spacer()
			
			Text("Drag the image around the screen")
				.font(.caption)
		}
	}
}

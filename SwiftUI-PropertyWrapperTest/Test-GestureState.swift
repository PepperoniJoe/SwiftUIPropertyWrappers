//
//  Test-GestureState.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/9/23.
//

import SwiftUI


struct TestGestureStateView: View {
	
	@GestureState private var dragStar = CGSize.zero
	@GestureState private var dragCircles = CGSize.zero
	
	var body: some View {
		VStack {
			Text("@GestureState").font(.title)
			Text("used to remember the original gesture state such as the original position").font(.caption)
			
			Spacer()
			
			ZStack {
				Image(systemName: "star")
					.font(.system(size: 100))
					.foregroundColor(.teal)
				
				Image(systemName: "star.fill")
					.font(.system(size: 100))
					.offset(dragStar)
					.foregroundColor(.teal)
					.animation(.easeInOut, value: dragStar)
					.gesture(
						DragGesture().updating($dragStar) { value, state, transaction in
							state = value.translation
						}
					)
			}
			
			Spacer()
			
			ZStack {
				Image(systemName: "circle.hexagonpath")
					.font(.system(size: 100))
					.foregroundColor(.pink)
				
				Image(systemName: "circle.hexagonpath.fill")
					.font(.system(size: 100))
					.offset(dragCircles)
					.animation(.easeInOut, value: dragCircles)
					.foregroundColor(.pink)
					.gesture(
						DragGesture().updating($dragCircles, body: { (value, state, transaction) in
								state = value.translation
							})
					)
			}
			
			Spacer()
			
			Text("Drag the image around the screen")
				.font(.caption)
		}
	}
}

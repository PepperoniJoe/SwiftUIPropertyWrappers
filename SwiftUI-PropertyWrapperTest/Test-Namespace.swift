//
//  Test-Namespace.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/9/23.
//

import SwiftUI

///
///Namespace
///
struct TestNamespaceView: View {
	
	@Namespace var nspace
	@State private var flag: Bool = true
	
	var body: some View {
		VStack {
			Text("@Namespace").font(.title)
			Text("used to give a persistent name to an object instance").font(.caption)
			
			if flag {
				Circle()
					.fill(Color.green)
					.matchedGeometryEffect(id: "m1", in: nspace)
					.frame(width: 100, height: 100)
				
				Rectangle()
					.fill(Color.yellow)
					.matchedGeometryEffect(id: "m2", in: nspace)
					.frame(width: 150, height: 50)
					.zIndex(1)
				
				Circle()
					.fill(Color.blue)
					.matchedGeometryEffect(id: "m3", in: nspace)
					.frame(width: 100, height: 100)
					.zIndex(2)
			}
			
			Spacer()
			
			Button("Switch") { withAnimation(.easeInOut(duration: 1.0)) { flag.toggle() }
			}
			
			Spacer()
			
			HStack {
				if !flag {
					Rectangle()
						.fill(Color.red)
						.matchedGeometryEffect(id: "m2", in: nspace)
						.frame(width: 25, height: 150)
					
					Capsule()
						.fill(Color.blue)
						.matchedGeometryEffect(id: "m3", in: nspace)
						.frame(width: 80, height: 50)
						.zIndex(2)
					
					RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
						.fill(Color.purple)
						.matchedGeometryEffect(id: "m1", in: nspace)
						.frame(width: 50, height: 50)
						.zIndex(1)
					
					Text("Neat Effect")
						.matchedGeometryEffect(id: "m4", in: nspace)
						.font(.caption)
					
				} else {
					
					Text("Animation uses namespace with MatchedGeometryEffect")
						.matchedGeometryEffect(id: "m4", in: nspace)
						.font(.caption)
				}
			}
		}
	}
}


struct Mine1View_Previews: PreviewProvider {
	static var previews: some View {
		TestNamespaceView()
	}
}

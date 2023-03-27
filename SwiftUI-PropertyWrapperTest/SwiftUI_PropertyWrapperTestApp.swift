//
//  SwiftUI_PropertyWrapperTestApp.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/8/23.
//

import SwiftUI

@main
struct SwiftUI_PropertyWrapperTestApp: App {
	
	@UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
	
    var body: some Scene {
        WindowGroup {
            ContentView()
						.environmentObject(TestObservableObjectVM())
						.environmentObject(TestBigVM())
        }
    }
}

//
//  SwiftUI_PropertyWrapperTestApp.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/8/23.
//

import SwiftUI

@main
struct SwiftUI_PropertyWrapperTestApp: App {
	
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
    var body: some Scene {
        WindowGroup {
            ContentView()
						.environmentObject(TestObservableObjectVM())
						.environmentObject(TestBigVM())
        }
    }
}

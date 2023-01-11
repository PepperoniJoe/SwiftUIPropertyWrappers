//
//  Test-UIApplicationDelegateAdaptor.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/9/23.
//

import SwiftUI

	///
	///  @UIApplicationDelegateAdaptor
	/// Use @NSApplicationDelegateAdaptor for AppKit
	///
	///1. Add AppDelegate class with needed functions
	///2. Add the property wrapper to top of view hierarchy
	///3. Display the app delegate messages
	///
struct TestUIDelegateView: View {
	
	@EnvironmentObject var appDelegate: AppDelegate 

	var body: some View {
		VStack {
			Text("@UIApplicationDelegateAdaptor").font(.title2 )
			Text("used to access UIApplicationDelegate notifications").font(.caption )
			
			Spacer()
			
			Text("Messages: \(appDelegate.message)")
			
			Spacer()
			
			Text("Use simulator application menu to trigger a memory warning").font(.caption)
			Text("Menu: Debug -> Simulate Memory Warning").font(.caption)
		}
	}
}



	/// For use with UIApplicationDelegateAdaptor
class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
	
	@Published var message: String = ""
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		
		message = "App did finish launching"
		return true
	}
	
	func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
		message = "App did receive memory warning"
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
		message = "App did become active"
	}
	
	func applicationDidEnterBackground(_ application: UIApplication) {
		message = "App did enter background"
	}
}

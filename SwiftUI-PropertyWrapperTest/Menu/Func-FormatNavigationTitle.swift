//
//  Func-FormatNavigationTitle.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/11/23.
//

import SwiftUI


func formatNavTitle(_ fontSize: CGFloat, _ largeFontSize: CGFloat) {
	let appearance = UINavigationBarAppearance()
	
	appearance.largeTitleTextAttributes = [
		.font : UIFont.systemFont(ofSize: largeFontSize),
		NSAttributedString.Key.foregroundColor : UIColor.label
	]
	
	appearance.titleTextAttributes = [
		.font : UIFont.systemFont(ofSize: fontSize),
		NSAttributedString.Key.foregroundColor : UIColor.label
	]
	
	UINavigationBar.appearance().scrollEdgeAppearance = appearance
	UINavigationBar.appearance().standardAppearance = appearance
	UINavigationBar.appearance().tintColor = .label
}

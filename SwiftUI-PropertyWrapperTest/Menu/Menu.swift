//
//  Menu.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/11/23.
//

import SwiftUI


struct MenuView: View {
	
	/// Format the navigation title
//	init() { formatNavTitle(30, 20) }
	
	@State private var wrapperChoices: [WrapperChoice] = [
		WrapperChoice(description: "@State", 															value: .state),
		WrapperChoice(description: "@State, @Binding", 				  					value: .stateBinding),
		WrapperChoice(description: "Multilevel @State, @Binding", 				value: .multiStateBinding),
		WrapperChoice(description: "@Published, @EnvironmentObject", 			value: .environmentObject),
		WrapperChoice(description: "More @Published, @EnvironmentObject",	value: .bigObservableObject),
		WrapperChoice(description: "@AppStorage", 												value: .appStorage),
		WrapperChoice(description: "@AppStorage with @Binding", 				  value: .appStorageWithBinding),
		WrapperChoice(description: "@StateObject", 												value: .stateObject),
		WrapperChoice(description: "@StateObject, @ObservedObject", 			value: .stateObjObservedObj),
		WrapperChoice(description: "@FetchRequest", 											value: .fetchRequest),
		WrapperChoice(description: "@SceneStorage", 											value: .sceneStorage),
		WrapperChoice(description: "@Environment", 											  value: .environment),
		WrapperChoice(description: "@ScaledMetric", 											value: .scaledMetric),
		WrapperChoice(description: "@GestureState", 											value: .gestureState),
		WrapperChoice(description: "@Namespace", 											    value: .namespace),
		WrapperChoice(description: "@FocusBinding", 											value: .focusBinding),
		WrapperChoice(description: "@FocusValue", 											  value: .focusValue),
		WrapperChoice(description: "@UIApplicationDelegateAdaptor", 			value: .uiApplicationDelegateAdaptor),
	]
	
	var body: some View {
		
		NavigationStack {
			List(wrapperChoices) { wrapperChoice in
				NavigationLink(wrapperChoice.description, value: wrapperChoice.value)
			}
			.navigationDestination(for: Wrapper.self) { wrapper in
				MenuDestination(wrapper: wrapper)
			}
			.navigationTitle(Text("SwiftUI Property Wrappers"))
		}
	}
}


struct WrapperChoice: Identifiable {
	var id					: UUID = UUID()
	let description : String
	let value       : Wrapper
}


struct MenuDestination: View {
	
	@State var wrapper: Wrapper
	
	var body: some View {
		switch wrapper {
			case .state                  		   : TestStateView()
			case .stateBinding           		   : TestStateBindingView()
			case .multiStateBinding      		   : TestStateBindingMultiLevelView()
			case .environmentObject    				 : TestEnvironmentObjectView()
			case .bigObservableObject 				 : TestBig0View()
			case .appStorage          				 : TestBasicAppStorageView()
			case .appStorageWithBinding   		 : TestAppStorageView()
			case .stateObject							 		 : TestStateObjectView()
			case .stateObjObservedObj					 : TestStateObjObsObjView()
			case .fetchRequest						 		 : TestFetchRequestView()
			case .sceneStorage						 		 : TestSceneStorageView()
			case .environment							 		 : TestEnvironmentView()
			case .scaledMetric								 : TestScaledMetricView()
			case .gestureState						 		 : TestGestureStateView()
			case .namespace						 		 		 : TestNamespaceView()
			case .focusBinding						 		 : TestFocusBindingView()
			case .focusValue						 			 : TestFocusValueView()
			case .uiApplicationDelegateAdaptor : TestUIDelegateView()
		}
	}
}


enum Wrapper {
	case state
	case stateBinding
	case multiStateBinding
	case environmentObject
	case bigObservableObject
	case appStorage
	case appStorageWithBinding
	case stateObject
	case stateObjObservedObj
	case fetchRequest
	case sceneStorage
	case environment
	case scaledMetric
	case gestureState
	case namespace
	case focusBinding
	case focusValue
	case uiApplicationDelegateAdaptor
}

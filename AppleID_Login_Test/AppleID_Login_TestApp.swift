//
//  AppleID_Login_TestApp.swift
//  AppleID_Login_Test
//
//  Created by Tasuku Yamamoto on 7/24/22.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var hasOnboarded: Bool
    
    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
    }
}//End of class

@main
struct AppleID_Login_TestApp: App {
    @ObservedObject var appState = AppState(hasOnboarded: false)
    
    var body: some Scene {
        WindowGroup {
            if appState.hasOnboarded {
                MainView()
                    .environmentObject(appState)
            } else {
                OnboardingFlowView()
                    .environmentObject(appState)
            }
        }
    }
}//End of struct

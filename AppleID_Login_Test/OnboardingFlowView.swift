//
//  SignInView.swift
//  AppleID_Login_Test
//
//  Created by Tasuku Yamamoto on 7/25/22.
//

import SwiftUI

struct OnboardingFlowView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        AppleIDSignIn()
            .environmentObject(appState)
    }
}

struct OnboardingFlowView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFlowView()
    }
}

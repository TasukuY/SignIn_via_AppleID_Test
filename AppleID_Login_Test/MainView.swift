//
//  ContentView.swift
//  AppleID_Login_Test
//
//  Created by Tasuku Yamamoto on 7/24/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Text("Welcome to the Main View")
        if let user = UserVM.shared.user {
            Text("Email: \(user.email)")
            Text("Username: \(user.firstName) \(user.lastName)")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  AppleIDSignIn.swift
//  AppleID_Login_Test
//
//  Created by Tasuku Yamamoto on 7/24/22.
//

import SwiftUI
import AuthenticationServices

struct AppleIDSignIn: View {

    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var appState: AppState

    var body: some View {
       
        SignInWithAppleButton(.continue) { request in
            
            request.requestedScopes = [.email, .fullName]
            
        } onCompletion: { result in
        
            switch result {
                case .success(let auth):
                    switch auth.credential {
                        case let appleIDCredentials as ASAuthorizationAppleIDCredential:
                            if let appleUser = AppleUser(credentials: appleIDCredentials) {
                                let appleUserData = try? JSONEncoder().encode(appleUser)
                                UserDefaults.standard.setValue(appleUserData, forKey: appleUser.userID)
                                UserVM.shared.user = appleUser
                                appState.hasOnboarded = true
                            }
                            //Login handler after the user signed in.
                            else {
                                if let appleUserData = UserDefaults.standard.data(forKey: appleIDCredentials.user),
                                   let appleUser = try? JSONDecoder().decode(AppleUser.self, from: appleUserData) {
                                    UserVM.shared.user = appleUser
                                    appState.hasOnboarded = true
                                }
                                else {
                                    print("Login Failed")
                                }
                            }
                        default:
                            print("Default: \(auth.credential)")
                    }
                
                case .failure(let error):
                    print("Error while requesting Apple Authentication: \(error.localizedDescription)")
            }
            
        }
        .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
        .frame(height: 50, alignment: .center)
        .padding()
        .cornerRadius(10)
    }
}

struct AppleIDSignIn_Previews: PreviewProvider {
    static var previews: some View {
        AppleIDSignIn()
            .previewLayout(.sizeThatFits)
    }
}

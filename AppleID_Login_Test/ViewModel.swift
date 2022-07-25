//
//  ViewModel.swift
//  AppleID_Login_Test
//
//  Created by Tasuku Yamamoto on 7/25/22.
//

import Foundation
import AuthenticationServices

class UserVM {
    static let shared = UserVM()
    var user: AppleUser?
}

struct AppleUser: Codable, Equatable {

    let userID: String
    let firstName: String
    let lastName: String
    let email: String
    
    init?(credentials: ASAuthorizationAppleIDCredential) {
        guard let firstName = credentials.fullName?.givenName,
              let lastName = credentials.fullName?.familyName,
              let email = credentials.email
        else { return nil }

            self.userID = credentials.user
            self.email = email
            self.firstName = firstName
            self.lastName = lastName
    }
}

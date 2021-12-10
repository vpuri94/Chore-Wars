//
//  AuthViewModel.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 11/25/21.
//
//
//import Foundation
//import Firebase
//import GoogleSignIn
//

import FirebaseAuth
class AuthViewModel {
    static var authUser:FirebaseAuth.User? = nil

    static var currentTeam: Team? = nil
    static var teamCode: String? = ""
    static var currentReward: String = ""
    static var currentPunishment: String = ""

    
}
//
//  // 1
//  enum SignInState {
//    case signedIn
//    case signedOut
//  }
//
//  // 2
//  @Published var state: SignInState = .signedOut
//
//  // 3
//  override init() {
//    super.init()
//
//    setupGoogleSignIn()
//  }
//
//  // 4
//  func signIn() {
//      if GIDSignIn.sharedInstance.currentUser == nil {
//      GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
//        GIDSignIn.sharedInstance.signIn()
//    }
//  }
//
//  // 5
//  func signOut() {
//      GIDSignIn.sharedInstance.signOut()
//
//    do {
//      try Auth.auth().signOut()
//
//      state = .signedOut
//    } catch let signOutError as NSError {
//      print(signOutError.localizedDescription)
//    }
//  }
//
//  // 6
//  private func setupGoogleSignIn() {
//    GIDSignIn.sharedInstance().delegate = self
//  }
//}
//
//extension  {
//  private func setupAuthentication() {
//    FirebaseApp.configure()
//  }
//}

//
//  PityApp.swift
//  Pity
//
//  Created by Can Seyhan on 10.01.2022.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct PityApp: App {
    init() {
       FirebaseApp.configure()
     }
     
    var body: some Scene {
        WindowGroup {
            LogInView()
            
        }
    }
}

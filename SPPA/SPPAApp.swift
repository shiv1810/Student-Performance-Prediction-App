//
//  SPPAApp.swift
//  SPPA
//
//  Created by Shiv Mistry on 10/11/23.
//

import SwiftUI
import Firebase

@main
struct SPPAApp: App {
    
    init(){
        FirebaseApp.configure()
        print("Configured Firebase!!")
        
       
        
    }
    
    

    var body: some Scene {
        WindowGroup {
            SignIn_StudentView()
        }
    }
}

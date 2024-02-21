//
//  SignIn_FacultyView.swift
//  SPPA
//
//  Created by Shiv Mistry on 30/11/23.
//
import SwiftUI

struct SignIn_FacultyView: View {
    @State private var facultyID = ""
    @State private var password = ""
    @State private var isFacultyDashboardVisible = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Text("Faculty Sign In")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Faculty ID", text: $facultyID)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                
                NavigationLink("Student?") {
                    SignIn_StudentView()
                        .navigationBarBackButtonHidden(true) // 1
                    
                }
            }
            
            
            NavigationLink("Login") {
                ContentView()
                    .navigationBarBackButtonHidden(true) // 1
                
            }                .padding()
            
            
        }
        
        
    }
    
}

#Preview {
    SignIn_FacultyView()
}

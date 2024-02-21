//
//  SignIn_StudentView.swift
//  SPPA
//
//  Created by Shiv Mistry on 30/11/23.
//

import SwiftUI

struct SignIn_StudentView: View {
    @State private var studentID = ""
    @State private var password = ""
    @State private var isStudentDashboardVisible = false

    var body: some View {
        NavigationStack{
            VStack {
                Text("Student Sign In")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                TextField("Student ID", text: $studentID)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
               

                
                    NavigationLink("Faculty?") {
                        SignIn_FacultyView()
                            .navigationBarBackButtonHidden(true) // 1

                    }
                }
                

            NavigationLink("Login") {
                StudentView()
                    .navigationBarBackButtonHidden(true) // 1
                
            }                .padding()
            
       
            }
        }
    
}
#Preview {
    SignIn_StudentView()
}

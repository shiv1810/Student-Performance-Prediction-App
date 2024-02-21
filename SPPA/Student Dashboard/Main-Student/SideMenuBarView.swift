//
//  SideMenuBarView.swift
//  SPPA
//
//  Created by Shiv Mistry on 26/11/23.
//

import Foundation
import SwiftUI

struct SideMenuView: View {
    @Binding var isMenuVisible: Bool

    var body: some View {
        
        NavigationView {
            List {
                NavigationLink(destination: StudentDashboardView()) {
                    Label("Home", systemImage: "house")
                }

                NavigationLink(destination: Text("Past Performance")) {
                    Label("Past Performance", systemImage: "chart.bar")
                }
                
                
                NavigationLink(destination: Text("Current Performance")) {
                    Label("CurrentPerformance", systemImage: "chart.bar")
                }
                
                
                NavigationLink(destination: CredentialsView()) {
                    Label("Predict Performance", systemImage: "chart.bar")
                }
               
            
                NavigationLink(destination: SignIn_StudentView()) {
                    Label("Sign Out", systemImage: "arrow.right.square")
                        .foregroundColor(.red)
                }
                
                
            }
            .listStyle(SidebarListStyle())  // For macOS
            .navigationTitle("Menu")
            .navigationBarItems(trailing: Button("Close") {
                isMenuVisible.toggle()
            })
        }
    }
}

//
//  F-SideMenuBarView.swift
//  SPPA
//
//  Created by Shiv Mistry on 30/11/23.
//

import SwiftUI
import SwiftUI

struct FSideMenuBarView: View {
    @Binding var isMenuVisible: Bool
    @State private var isUploadMarksVisible = false
    @State private var isPredictMarksVisible = false

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Home")) {
                    Label("Home", systemImage: "house")
                }

                NavigationLink(destination: Text("Past Performance")) {
                    Label("Past Performance", systemImage: "chart.bar")
                }

                NavigationLink(destination: UploadMarksView()) {
                    Label("Upload Marks", systemImage: "arrow.up.circle")
                }
                .onTapGesture {
                    isMenuVisible.toggle()
                }

                NavigationLink(destination: CredentialsView()) {
                    Label("Predict Marks", systemImage: "chart.bar")
                }
                .onTapGesture {
                    isMenuVisible.toggle()
                }

                NavigationLink(destination: SignIn_FacultyView()) {
                    Label("Sign Out", systemImage: "arrow.right.square")
                        .foregroundColor(.red)
                }
                .onTapGesture {
                    // Handle sign-out logic
                    isMenuVisible.toggle()
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

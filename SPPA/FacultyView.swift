//
//  FacultyView.swift
//  SPPA
//
//  Created by Shiv Mistry on 04/02/24.
//

import SwiftUI

struct FacultyView: View {
    var body: some View {
        TabView {
            
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            UploadMarksView()
                .tabItem { Label("Explore", systemImage: "sportscourt.fill")
                }
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.circle.fill")
                }
          
    }
    }
}

#Preview {
    FacultyView()
}

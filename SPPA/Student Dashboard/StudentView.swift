//
//  StudentView.swift
//  SPPA
//
//  Created by Shiv Mistry on 04/02/24.
//

import SwiftUI

enum Tabs: String {
    case home
    case analysis
    case profile
}

struct StudentView: View {
    @State var selectedTab: Tabs = .home
    
    var body: some View {
        NavigationView{
            TabView(selection:$selectedTab) {
                
                StudentHomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tag(Tabs.home)
                ContentView()
                    .tabItem { Label("Analysis", systemImage: "chart.xyaxis.line")
                    }
                    .tag(Tabs.analysis)
                ProfileView()
                    .tabItem { Label("Profile", systemImage: "person.crop.circle")
                    }
                    .tag(Tabs.profile)
                
            }.navigationTitle(selectedTab.rawValue.capitalized)
        }
    }
}

#Preview {
    StudentView()
}

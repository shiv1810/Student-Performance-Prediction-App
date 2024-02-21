//
//  StudentHomeView.swift
//  SPPA
//
//  Created by Shiv Mistry on 05/02/24.
import SwiftUI

struct StudentHomeView: View {
    var body: some View {
        VStack {
            
            HStack{
                Text("Essentials")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.bottom)
                    .padding(.leading)
                
                
                Spacer()
                
            }
            
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                ForEach(["Attendance", "Predictions", "Announcements", "More"], id: \.self) { item in
                    NavigationLink(destination: Text(item + " Details")) {
                        ColorCard(color: colorForItem(item), text: item, systemImage: systemImageForItem(item))
                    }
                    .buttonStyle(PlainButtonStyle()) // To remove the default button style
                }
            }
            .padding(16)
        }
    }
}

struct ColorCard: View {
    let color: Color
    let text: String
    let systemImage: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20) // Increased corner radius for rounded corners
                .fill(color)
                .frame(height: 120) // Increased height for larger cards
                .opacity(0.8) // Adjusted opacity for a more vibrant appearance
                .overlay(
                    VStack{
                        HStack{
                            Image(systemName: systemImage)
                                .font(.system(size: 25))
                                .padding(.leading, 10)
                                .padding(.top, 5)
                                // Increased font size for larger system image
                            Spacer()
                            Image(systemName: "ellipsis.circle.fill")
                                .font(.system(size: 28))
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)// Increased font size for larger system image
                        }
                        
                        Spacer()
                        HStack{
                            Text(text)
                                .font(.body)
                                .foregroundColor(.white)
                                .padding()
                            Spacer()
                        }
                    }
            )
        }
    }
}

// Helper function to assign a color based on the item name
func colorForItem(_ item: String) -> Color {
    switch item {
    case "Attendance":
        return Color.blue.opacity(0.9) // Adjusted opacity for a more vibrant appearance
    case "Predictions":
        return Color.green.opacity(0.9) // Adjusted opacity for a more vibrant appearance
    case "Announcements":
        return Color.orange.opacity(0.9) // Adjusted opacity for a more vibrant appearance
    case "More":
        return Color.purple.opacity(0.9) // Adjusted opacity for a more vibrant appearance
    default:
        return Color.gray.opacity(0.9) // Adjusted opacity for a more vibrant appearance
    }
}

// Helper function to assign a system image based on the item name
func systemImageForItem(_ item: String) -> String {
    switch item {
    case "Attendance":
        return "calendar"
    case "Predictions":
        return "chart.xyaxis.line"
    case "Announcements":
        return "megaphone.fill"
    case "More":
        return "plus.app"
    default:
        return ""
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        StudentHomeView()
    }
}

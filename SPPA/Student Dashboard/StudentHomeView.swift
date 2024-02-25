//
//  StudentHomeView.swift
//  SPPA
//
//  Created by Shiv Mistry on 05/02/24.
import SwiftUI

struct StudentHomeView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 1) {
                        ForEach(1...2, id: \.self) { index in
                            CardView(imageName: "\(index)")
                        }
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.0)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.7, y: phase.isIdentity ? 1.0 : 0.7)
                                .offset(y: phase.isIdentity ? 0 : 40)
                        }
                    }
                    .padding(.bottom)
                    .ignoresSafeArea()
                    .scrollTargetLayout()
                }
                .contentMargins(1, for: .scrollContent)
                
                HStack {
                    Text("Essentials")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom)
                        .padding(.leading)
                        .padding(.top)
                    
                    Spacer()
                }
                
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                    ForEach(["Attendance", "Predictions", "Time Table", "More"], id: \.self) { item in
                        NavigationLink(destination: destinationForItem(item)) {
                            ColorCard(color: colorForItem(item), text: item, systemImage: systemImageForItem(item))
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.bottom, 90)
            }
        }
        .ignoresSafeArea()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CardView: View {
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 600)
                .cornerRadius(20)
                .opacity(0.8)
            
            VStack(alignment: .leading, spacing: 8) {
                Button(action: {
                    // Your button action here
                }) {
                    Button {
                        print("Button was tapped")
                    } label: {
                        Text("Predict Here!")
                            .padding()
                            .foregroundStyle(.white)
//                            .background(.blue)
//                            .hoverEffect(.lift)
                            .background(
                                        RoundedRectangle(
                                            cornerRadius: 12,
                                            style: .continuous
                                        )
                                        .stroke(.white, lineWidth: 2)

                                    )
                    }
                }
                HStack {
                    Text("You can now predict your upcoming Semesters CGPA here")
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .italic()
                }
            }
            .padding()
        }
        .frame(width: 400, height: 600)
    }
}

struct ColorCard: View {
    let color: Color
    let text: String
    let systemImage: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .frame(height: 120)
                .opacity(0.8)
                .overlay(
                    VStack {
                        HStack {
                            Image(systemName: systemImage)
                                .font(.system(size: 25))
                                .padding(.leading, 10)
                                .padding(.top, 5)
                            Spacer()
                            Image(systemName: "ellipsis.circle.fill")
                                .font(.system(size: 28))
                                .padding(.all, 10)
                        }
                        Spacer()
                        HStack {
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

func colorForItem(_ item: String) -> Color {
    switch item {
    case "Attendance":
        return Color.blue.opacity(0.9)
    case "Predictions":
        return Color.green.opacity(0.9)
    case "Time Table":
        return Color.orange.opacity(0.9)
    case "More":
        return Color.purple.opacity(0.9)
    default:
        return Color.gray.opacity(0.9)
    }
}

func systemImageForItem(_ item: String) -> String {
    switch item {
    case "Attendance":
        return "calendar"
    case "Predictions":
        return "chart.xyaxis.line"
    case "Time Table":
        return "clock"
    case "More":
        return "plus.app"
    default:
        return ""
    }
}

func destinationForItem(_ item: String) -> some View {
    switch item {
    case "Attendance":
        return AnyView(Text("Attendance Details"))
    case "Predictions":
        return AnyView(CredentialsView())
    case "Time Table":
        return AnyView(TimeTable_View())
    default:
        return AnyView(ProfileView())
    }
}

struct StudentHomeView_Previews: PreviewProvider {
    static var previews: some View {
        StudentHomeView()
    }
}

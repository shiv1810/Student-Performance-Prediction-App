//
//  ProfileView.swift
//  SPPA
//
//  Created by Shiv Mistry on 05/02/24.
//
import SwiftUI

struct ProfileView: View {
    @State private var userName: String = "" // State variable to hold the user's name
    
    let profileLinkNames: [String] = ["Your Bookings", "Your Contact Card","Join Us", "About Us"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("\(userName)")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            .background(Color(.systemBackground))
            .border(Color(.systemGray), width: 0.5)
            .padding(.bottom, 5)
            
            Divider()
            
            ForEach(profileLinkNames, id: \.self) { profileLinkName in
                VStack {
                    HStack {
                        Text(profileLinkName)
                            .font(.body)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(.systemGray3))
                            .font(.system(size: 20))
                    }
                    .contentShape(Rectangle())
                    .padding(EdgeInsets(top: 17, leading: 21, bottom: 17, trailing: 21))
                    
                    Divider()
                }
            }
        }
        .navigationBarItems(
            leading: Text("Premium Member")
                .font(.body)
                .foregroundColor(Color(.systemGray)),
            trailing: Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

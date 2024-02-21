//
//  CredentialsView.swift
//  SPPA
//
//  Created by Shiv Mistry on 30/11/23.
//

// CredentialsView.swift
// CredentialsView.swift

import SwiftUI

struct CredentialsView: View {
    @State private var enrolmentID = ""
    @State private var name = ""
    @State private var isPredictedCGPAPresented = false

    var body: some View {
       
            VStack {
                Text("Please Confirm Your Credentials")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .italic()

                TextField("Enrolment ID", text: $enrolmentID)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Name", text: $name)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                NavigationLink(
                    destination: PredictedCGPAView(),
                    isActive: $isPredictedCGPAPresented
                ) {
                    EmptyView()
                }

                Button("Predict Now") {
                    // Handle prediction logic
                    // Assuming you want to navigate to PredictedCGPAView when the button is tapped
                    isPredictedCGPAPresented.toggle()
                }
                .padding()
            }
            .navigationBarTitle("Confirm")
            .padding()
        
    }
}

#if DEBUG
struct CredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsView()
    }
}
#endif

#Preview {
    CredentialsView()
}

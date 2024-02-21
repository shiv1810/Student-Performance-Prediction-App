//
//  UploadFileView.swift
//  SPPA
//
//  Created by Shiv Mistry on 30/11/23.
//

import SwiftUI

// UploadMarksSheetView.swift

import SwiftUI

struct UploadMarksView: View {
    @State private var year = ""
    @State private var division = ""

    var body: some View {
        NavigationStack{
            VStack {
                TextField("Year", text: $year)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Division", text: $division)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
               
//                NavigationLink(destination: UpdateMarksView(year: year, division: division))
                NavigationLink(destination: StudentDataVMView())
                {
                    Text("Update")
                }
            }
        }
            .navigationBarTitle("Upload Marks")
            .padding()
        
    }
}

#Preview {
    UploadMarksView()
}

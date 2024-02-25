//
//  ContentView.swift
//  BookstoreStategist
//
//  Created by Shiv Mistry on 04/02/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var salesViewModel: SalesViewModel = .preview

    
    var body: some View {
        NavigationStack {
            
            List {
                Section {
                    NavigationLink {
                        DetailBookSalesView(salesViewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        SimpleBookSalesView(salesViewModel: salesViewModel)
                    }
                }

                Section {
                    NavigationLink {
                    SalesByWeekdayView(salesViewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        SimpleSalesByWeekdayView(salesViewModel: salesViewModel)
                    }
                }
                
                Section {
                    NavigationLink {
                        SalesPerBookCategoryView(salesViewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                       
                        SimpleSalesPerBookCategoryPieChartView(salesViewModel: salesViewModel)
                    }
                }
                
                VStack {
                    NavigationLink(destination: CredentialsView()) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black)
                            .frame(width: 300, height: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 0.2)
                            )
                            .shadow(radius: 5)
                            .overlay(
                                VStack {
                                    Text("Predict Marks")
                                        .font(.headline)
                                        
                                    
                                    Text("You can now predict your marks")
                                        .font(.caption)
                                        .fontWeight(.thin)
                                        .italic()
                                    
                                    Text("Predict Now")
                                        .foregroundColor(.blue)
                                        .padding()
                                }
                            )
                    }
                }
                .padding()
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}

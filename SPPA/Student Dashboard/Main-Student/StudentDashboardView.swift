//
//  ContentView.swift
//  SPPA
//
//  Created by Shiv Mistry on 10/11/23.
//
// ContentView.swift
import SwiftUI

struct StudentDashboardView: View {
    @State private var isLineChartSheetPresented = false
    @State private var isHistogramSheetPresented = false
    @State private var isMenuVisible = false
    
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                
                VStack {
                    Divider()
                    
                    //MARK: - Title Bar
                    HStack {
                      
                        Button(action: {
                            isMenuVisible.toggle()
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                                .padding()
                        }
                        .sheet(isPresented: $isMenuVisible) {
                              SideMenuView(isMenuVisible: $isMenuVisible)
                        }
                        
                        Spacer()
                        
                        Text("Dashboard")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.trailing, 40.0)
                        
                        Image(systemName: "person.circle")
                            .imageScale(.large)
                            .padding()
                        
                        
                    }.padding(.bottom, 20)
                    
//                    // MARK: - Charts Stack 1
//                    HStack{
//                        Text("Subject-Wise Performance")
//                            .fontWeight(.semibold)
//                        Spacer()
//                    }
//                    
//                    ScrollView(.horizontal) {
//                        HStack {
//                            CardView {
//                                VStack {
//                                    Text("Line Chart")
//                                        .font(.subheadline)
//                                        .padding()
//                                    
//                                    LineChartView(dataPoints: ExampleData.lineChartPoints)
//                                        .padding()
//                                }
//                            }
//                            .onTapGesture {
//                                isLineChartSheetPresented.toggle()
//                            }
//                            .sheet(isPresented: $isLineChartSheetPresented) {
//                                LineChartSheet(dataPoints: ExampleData.lineChartPoints)
//                            }
//                            
//                            CardView {
//                                VStack {
//                                    Text("Histogram")
//                                        .font(.subheadline)
//                                        .padding(.top, 28.0)
//                                    
//                                    HistogramView(dataPoints: ExampleData.histogramPoints)
//                                        .padding()
//                                }
//                            }
//                            .onTapGesture {
//                                isHistogramSheetPresented.toggle()
//                            }
//                            .sheet(isPresented: $isHistogramSheetPresented) {
//                                HistogramSheet(dataPoints: ExampleData.histogramPoints)
//                            }
//                        }
//                    }
//                    
//                    // MARK: - Charts Stack 2
//                    HStack{
//                        Text("Class Performance")
//                            .fontWeight(.semibold)
//                        Spacer()
//                    }
//                    
//                    
//                    ScrollView(.horizontal) {
//                        HStack {
//                            CardView {
//                                VStack {
//                                    Text("Line Chart")
//                                        .font(.subheadline)
//                                        .padding()
//                                    
//                                    LineChartView(dataPoints: ExampleData.lineChartPoints)
//                                        .padding()
//                                }
//                            }
//                            .onTapGesture {
//                                isLineChartSheetPresented.toggle()
//                            }
//                            .sheet(isPresented: $isLineChartSheetPresented) {
//                                LineChartSheet(dataPoints: ExampleData.lineChartPoints)
//                            }
//                            
//                            CardView {
//                                VStack {
//                                    Text("Histogram")
//                                        .font(.subheadline)
//                                        .padding(.top, 28.0)
//                                    
//                                    HistogramView(dataPoints: ExampleData.histogramPoints)
//                                        .padding()
//                                }
//                            }
//                            .onTapGesture {
//                                isHistogramSheetPresented.toggle()
//                            }
//                            .sheet(isPresented: $isHistogramSheetPresented) {
//                                HistogramSheet(dataPoints: ExampleData.histogramPoints)
//                            }
//                        }
//                    }
//                    
//                    
//                    Spacer()
//                    
                    // MARK: - Prediction Section
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
                .navigationBarTitle("Welcome")
                .padding()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentDashboardView()
        }
    }


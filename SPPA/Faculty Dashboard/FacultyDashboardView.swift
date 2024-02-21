//
//  FacultyDashboard.swift
//  SPPA
//
//  Created by Shiv Mistry on 30/11/23.
//
//
//import SwiftUI
//
//struct FacultyDashboardView: View {
//    @State private var isLineChartSheetPresented = false
//    @State private var isHistogramSheetPresented = false
//    @State private var isMenuVisible = false
//    @State private var isUploadMarksVisible = false
//    @State private var isPredictMarksVisible = false
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                
//                VStack {
//                    Divider()
//                    
//                    //MARK: - Title Bar
//                    HStack {
//                        
//                        Button(action: {
//                            isMenuVisible.toggle()
//                        }) {
//                            Image(systemName: "line.horizontal.3")
//                                .imageScale(.large)
//                                .padding()
//                        }
//                        .sheet(isPresented: $isMenuVisible) {
//                            FSideMenuBarView(
//                                isMenuVisible: $isMenuVisible
//                            )
//                        }
//                        
//                        Spacer()
//                        
//                        Text("Dashboard")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .padding(.trailing, 40.0)
//                        
//                        Image(systemName: "person.circle")
//                            .imageScale(.large)
//                            .padding()
//                        
//                        
//                    }
//                    .padding(.bottom, 20)
//                    
//                    // MARK: - Upload Section
//                    NavigationLink(destination: UploadMarksView(), isActive: $isUploadMarksVisible) {
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color.black)
//                            .frame(width: 300, height: 120)
//                            .foregroundColor(.black)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.blue, lineWidth: 0.3)
//                            )
//                            .shadow(radius: 5)
//                            .overlay(
//                                VStack {
//                                    Text("Upload Marks")
//                                        .font(.headline)
//                                    
//                                    Text("Help the predictions by uploading marks here")
//                                        .font(.caption)
//                                        .fontWeight(.thin)
//                                        .italic()
//                                    
//                                    Text("Upload Now")
//                                        .padding()
//                                }
//                            )
//                    }
//                    .padding()
//                    
////                    // MARK: - Charts Stack 1
////                    HStack{
////                        Text("Subject-Wise Performance")
////                            .fontWeight(.semibold)
////                        Spacer()
////                    }
////                    
////                    ScrollView(.horizontal) {
////                        HStack {
////                            CardView {
////                                VStack {
////                                    Text("Line Chart")
////                                        .font(.subheadline)
////                                        .padding()
////                                    
////                                    LineChartView(dataPoints: ExampleData.lineChartPoints)
////                                        .padding()
////                                }
////                            }
////                            .onTapGesture {
////                                isLineChartSheetPresented.toggle()
////                            }
////                            .sheet(isPresented: $isLineChartSheetPresented) {
////                                LineChartSheet(dataPoints: ExampleData.lineChartPoints)
////                            }
////                            
////                            CardView {
////                                VStack {
////                                    Text("Histogram")
////                                        .font(.subheadline)
////                                        .padding(.top, 28.0)
////                                    
////                                    HistogramView(dataPoints: ExampleData.histogramPoints)
////                                        .padding()
////                                }
////                            }
////                            .onTapGesture {
////                                isHistogramSheetPresented.toggle()
////                            }
////                            .sheet(isPresented: $isHistogramSheetPresented) {
////                                HistogramSheet(dataPoints: ExampleData.histogramPoints)
////                            }
////                        }
////                    }
////                    
////                    // MARK: - Charts Stack 2
////                    HStack{
////                        Text("Class Performance")
////                            .fontWeight(.semibold)
////                        Spacer()
////                    }
////
////                    ScrollView(.horizontal) {
////                        HStack {
////                            CardView {
////                                VStack {
////                                    Text("Line Chart")
////                                        .font(.subheadline)
////                                        .padding()
////                                    
////                                    LineChartView(dataPoints: ExampleData.lineChartPoints)
////                                        .padding()
////                                }
////                            }
////                            .onTapGesture {
////                                isLineChartSheetPresented.toggle()
////                            }
////                            .sheet(isPresented: $isLineChartSheetPresented) {
////                                LineChartSheet(dataPoints: ExampleData.lineChartPoints)
////                            }
////                            
////                            CardView {
////                                VStack {
////                                    Text("Histogram")
////                                        .font(.subheadline)
////                                        .padding(.top, 28.0)
////                                    
////                                    HistogramView(dataPoints: ExampleData.histogramPoints)
////                                        .padding()
////                                }
////                            }
////                            .onTapGesture {
////                                isHistogramSheetPresented.toggle()
////                            }
////                            .sheet(isPresented: $isHistogramSheetPresented) {
////                                HistogramSheet(dataPoints: ExampleData.histogramPoints)
////                            }
////                        }
////                    }
////                    
////                    
////                    Spacer()
////                    
////                }
////                .navigationBarTitle("Welcome")
////                .padding()
////            }
////        }
////    }
////}
//
//struct FacultyDashboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FacultyDashboardView()
//    }
//}

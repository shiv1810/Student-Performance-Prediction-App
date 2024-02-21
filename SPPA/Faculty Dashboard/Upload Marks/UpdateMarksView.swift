////
////  UpdateMarksView.swift
////  SPPA
////
////  Created by Shiv Mistry on 01/12/23.
////
//
//
//import SwiftUI
//import FirebaseFirestore
//
//
//func uploadCSVToFirestore(fileURL: URL, completion: @escaping (Error?) -> Void) {
//    do {
//        let csvData = try Data(contentsOf: fileURL)
//        let csvString = String(data: csvData, encoding: .utf8)
//
//        guard let csvContent = csvString else {
//            completion(NSError(domain: "YourAppErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Unable to read CSV content"]))
//            return
//        }
//
//        let csvRows = csvContent.components(separatedBy: "\n")
//        var dataToUpload: [[String: Any]] = []
//
//        for row in csvRows {
//            let columns = row.components(separatedBy: ",")
//            var rowData: [String: Any] = [:]
//
//            // Customize this based on your CSV structure
//            rowData["school"] = columns[0]
//            rowData["sex"] = columns[1]
//            rowData["age"] = Int(columns[2]) ?? 0
//            rowData["address"] = columns[3]
//            rowData["famsize"] = columns[4]
//            rowData["Pstatus"] = columns[5]
//            rowData["Medu"] = Int(columns[6]) ?? 0
//            rowData["Fedu"] = Int(columns[7]) ?? 0
//            rowData["Mjob"] = columns[8]
//            rowData["Fjob"] = columns[9]
//            rowData["reason"] = columns[10]
//            rowData["guardian"] = columns[11]
//            rowData["traveltime"] = Int(columns[12]) ?? 0
//            rowData["studytime"] = Int(columns[13]) ?? 0
//            rowData["failures"] = Int(columns[14]) ?? 0
//            rowData["schoolsup"] = columns[15]
//            rowData["famsup"] = columns[16]
//            rowData["paid"] = columns[17]
//            rowData["activities"] = columns[18]
//            rowData["nursery"] = columns[19]
//            rowData["higher"] = columns[20]
//            rowData["internet"] = columns[21]
//            rowData["romantic"] = columns[22]
//            rowData["famrel"] = Int(columns[23]) ?? 0
//            rowData["freetime"] = Int(columns[24]) ?? 0
//            rowData["goout"] = Int(columns[25]) ?? 0
//            rowData["Dalc"] = Int(columns[26]) ?? 0
//            rowData["Walc"] = Int(columns[27]) ?? 0
//            rowData["health"] = Int(columns[28]) ?? 0
//            rowData["absences"] = Int(columns[29]) ?? 0
//            rowData["G1"] = Int(columns[30]) ?? 0
//            rowData["G2"] = Int(columns[31]) ?? 0
//            rowData["G3"] = Int(columns[32]) ?? 0
//
//            dataToUpload.append(rowData)
//        }
//
//        
//        // Upload data to Firestore
//        let collectionReference = Firestore.firestore().collection("students")
//
//        for data in dataToUpload {
//            collectionReference.addDocument(data: data) { error in
//                if let error = error {
//                    completion(error)
//                }
//            }
//        }
//
//        completion(nil)
//    } catch {
//        // Handle the error here
//        completion(error)
//    }
//}
//
//struct UpdateMarksView: View {
//    @State private var data: [[String]] = [
//        ["Enrolment ID", "Name", "Marks"],
//        ["E001", "Shiv", "85"],
//        ["E002", "Protham", "92"],
//        ["E003", "Pujan", "78"],
//        ["E004", "Govind", "90"],
//        ["E005", "Charlie", "88"]
//    ]
//
//    @State private var newColumnName: String = ""
//    @State private var isAddColumnSheetPresented = false
//    @State private var isCSVUploaded = false // Added state to track CSV upload status
//
//    
//    let year: String
//    let division: String
//    
//    var body: some View {
//        NavigationView {
//            
//                VStack {
//                    
//                    Text("Year: \(year)")
//                        .font(.title)
//                        .fontWeight(.semibold)
//                        .padding()
//                    
//                    Text("Division: \(division)")
//                        .font(.title)
//                        .fontWeight(.semibold)
//                        .padding()
//                    Button("Upload CSV") {
//                                        if let fileURL = Bundle.main.url(forResource: "student_data", withExtension: "csv") {
//                                            uploadCSVToFirestore(fileURL: fileURL) { error in
//                                                if let error = error {
//                                                    print("Error uploading CSV file to Firestore: \(error.localizedDescription)")
//                                                } else {
//                                                    isCSVUploaded = true
//                                                    print("CSV file uploaded to Firestore successfully!")
//                                                }
//                                            }
//                                        }
//                                    }
//                                    .padding()
//
//                    List {
//                        HStack {
//                            ForEach(data[0], id: \.self) { columnName in
//                                Text(columnName)
//                                    .bold()
//                                
//                                
//                                Spacer()
//                            }
//                        }
//                        
//                        
//                        ForEach(data[1...], id: \.self) { row in
//                            HStack {
//                                ForEach(row, id: \.self) { columnValue in
//                                    Text(columnValue)
//                                    Spacer()
//                                }
//                            }
//                        }
//                    }
//                    .listStyle(InsetListStyle())
//                    
//                    Button("Add Marks") {
//                        isAddColumnSheetPresented.toggle()
//                    }
//                    .padding()
//                    .sheet(isPresented: $isAddColumnSheetPresented) {
//                        AddColumnSheet(newColumnName: $newColumnName, data: $data)
//                    }
//                    
//                    NavigationLink(destination: DoneView(data: data)) {
//                        Text("Update")
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(8)
//                    }
//                    .padding()
//                }
//                .navigationTitle("Student Marks")
//            }
//        
//    }
//}
//
//struct AddColumnSheet: View {
//    @Binding var newColumnName: String
//    @Binding var data: [[String]]
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("New Column Name", text: $newColumnName)
//                    .padding()
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                Button("Add Column") {
//                    data[0].append(newColumnName)
//                    data.append(Array(repeating: "", count: data[0].count))
//                    newColumnName = ""
//                }
//                .padding()
//
//                Spacer()
//            }
//            .navigationBarTitle("Add Column")
//        }
//    }
//}
//
//struct DoneView: View {
//    var data: [[String]]
//
//    var body: some View {
//        VStack {
//            Text("Data Updated!")
//                .font(.title)
//                .fontWeight(.bold)
//                .padding()
//
//            // Additional content or feedback for the user
//        }
//        .navigationBarTitle("Done", displayMode: .inline)
//    }
//}
//
//struct UpdateMarksView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateMarksView(year: "2003", division: "3")
//    }
//}

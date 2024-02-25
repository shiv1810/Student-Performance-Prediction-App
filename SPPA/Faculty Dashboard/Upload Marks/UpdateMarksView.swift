////
////  UpdateMarksView.swift
////  SPPA
////
////  Created by Shiv Mistry on 01/12/23.
////
//
//
import SwiftUI
import FirebaseFirestore



struct UpdateMarksView: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                if let fileURL = URL(string: "file:///Users/shivmistry/Desktop/SPPA ML/students_data.csv") {
                    uploadCSVToFirestore(fileURL: fileURL) { error in
                        if let error = error {
                            print("Error uploading CSV to Firestore: \(error)")
                        } else {
                            print("CSV uploaded to Firestore successfully.")
                        }
                    }
                } else {
                    print("Invalid file URL.")
                }
            }
    }
}

func uploadCSVToFirestore(fileURL: URL, completion: @escaping (Error?) -> Void) {
    do {
        let csvData = try Data(contentsOf: fileURL)
        let csvString = String(data: csvData, encoding: .utf8)

        guard let csvContent = csvString else {
            completion(NSError(domain: "YourAppErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Unable to read CSV content"]))
            return
        }

        let csvRows = csvContent.components(separatedBy: "\n")
        var dataToUpload: [[String: Any]] = []

        for row in csvRows {
            let columns = row.components(separatedBy: ",")
            var rowData: [String: Any] = [:]

            // Customize this based on your CSV structure
            rowData["school"] = columns[0]
            rowData["sex"] = columns[1]
            rowData["age"] = Int(columns[2]) ?? 0
            rowData["address"] = columns[3]
            rowData["famsize"] = columns[4]
            rowData["Pstatus"] = columns[5]
            rowData["Medu"] = Int(columns[6]) ?? 0
            rowData["Fedu"] = Int(columns[7]) ?? 0
            rowData["Mjob"] = columns[8]
            rowData["Fjob"] = columns[9]
            rowData["reason"] = columns[10]
            rowData["guardian"] = columns[11]
            rowData["traveltime"] = Int(columns[12]) ?? 0
            rowData["studytime"] = Int(columns[13]) ?? 0
            rowData["failures"] = Int(columns[14]) ?? 0
            rowData["schoolsup"] = columns[15]
            rowData["famsup"] = columns[16]
            rowData["paid"] = columns[17]
            rowData["activities"] = columns[18]
            rowData["nursery"] = columns[19]
            rowData["higher"] = columns[20]
            rowData["internet"] = columns[21]
            rowData["romantic"] = columns[22]
            rowData["famrel"] = Int(columns[23]) ?? 0
            rowData["freetime"] = Int(columns[24]) ?? 0
            rowData["goout"] = Int(columns[25]) ?? 0
            rowData["Dalc"] = Int(columns[26]) ?? 0
            rowData["Walc"] = Int(columns[27]) ?? 0
            rowData["health"] = Int(columns[28]) ?? 0
            rowData["absences"] = Int(columns[29]) ?? 0
            rowData["G1"] = Int(columns[30]) ?? 0
            rowData["G2"] = Int(columns[31]) ?? 0
            rowData["G3"] = Int(columns[32]) ?? 0

            dataToUpload.append(rowData)
        }

        
        // Upload data to Firestore
        let collectionReference = Firestore.firestore().collection("student")

        for data in dataToUpload {
            collectionReference.addDocument(data: data) { error in
                if let error = error {
                    completion(error)
                }
            }
        }

        completion(nil)
    } catch {
        // Handle the error here
        completion(error)
    }
}
//
//if let fileURL = URL(string: "file:///Users/shivmistry/Desktop/SPPA ML/students_data") {
//    uploadCSVToFirestore(fileURL: fileURL) { error in
//        if let error = error {
//            print("Error uploading CSV to Firestore: \(error)")
//        } else {
//            print("CSV uploaded to Firestore successfully.")
//        }
//    }
//} else {
//    print("Invalid file URL.")
//}



struct UpdateMarksPreviews: PreviewProvider {
    static var previews: some View {
        UpdateMarksView()
    }
}
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
//import SwiftUI
//import Firebase
//import CSV
//
//struct ContentView: View {
//    var body: some View {
//        // Your SwiftUI content
//        Text("Hello, World!")
//            .padding()
//            .onAppear {
//                uploadDataToFirestore()
//            }
//    }
//
//    func uploadDataToFirestore() {
//
//        // Replace this with the actual URL or path to your CSV file
//        guard let fileURL = Bundle.main.url(forResource: "your_csv_file", withExtension: "csv") else {
//            print("CSV file not found.")
//            return
//        }
//
//        do {
//            let csv = try CSVReader.init(url: fileURL)
//            let rows = csv.enumeratedRows
//
//            for columns in rows {
//                let studentData = StudentData.fromCSV(columns: columns)
//
//                do {
//                    let documentRef = try firestore.collection("Div_A").addDocument(from: studentData)
//                    print("Document added with ID: \(documentRef.documentID)")
//                } catch {
//                    print("Error adding document to Firestore: \(error)")
//                }
//            }
//        } catch {
//            print("Error reading CSV file: \(error)")
//        }
//    }
//}
//
//// Rest of the code remains the same
//
//struct StudentData: Codable {
//    var school: String
//    var sex: String
//    var age: Int
//    var address: String
//    var famsize: String
//    var Pstatus: String
//    var Medu: Int
//    var Fedu: Int
//    var Mjob: String
//    var Fjob: String
//    var reason: String
//    var guardian: String
//    var traveltime: Int
//    var studytime: Int
//    var failures: Int
//    var schoolsup: String
//    var famsup: String
//    var paid: String
//    var activities: String
//    var nursery: String
//    var higher: String
//    var internet: String
//    var romantic: String
//    var famrel: Int
//    var freetime: Int
//    var goout: Int
//    var Dalc: Int
//    var Walc: Int
//    var health: Int
//    var absences: Int
//    var G1: Int
//    var G2: Int
//    var G3: Int
//
//    // Properties to store the sum of specific columns
//    var totalAge: Int = 0
//    var totalMedu: Int = 0
//    var totalFedu: Int = 0
//    var totalFailures: Int = 0
//    var totalTravelTime: Int = 0
//    // ... Add more properties for other columns
//
//    // Function to convert CSV columns to the data model
//    static func fromCSV(columns: [String]) -> StudentData {
//        var studentData = StudentData(
//            school: columns[0],
//            sex: columns[1],
//            age: Int(columns[2]) ?? 0,
//            address: columns[3],
//            famsize: columns[4],
//            Pstatus: columns[5],
//            Medu: Int(columns[6]) ?? 0,
//            Fedu: Int(columns[7]) ?? 0,
//            Mjob: columns[8],
//            Fjob: columns[9],
//            reason: columns[10],
//            guardian: columns[11],
//            traveltime: Int(columns[12]) ?? 0,
//            studytime: Int(columns[13]) ?? 0,
//            failures: Int(columns[14]) ?? 0,
//            schoolsup: columns[15],
//            famsup: columns[16],
//            paid: columns[17],
//            activities: columns[18],
//            nursery: columns[19],
//            higher: columns[20],
//            internet: columns[21],
//            romantic: columns[22],
//            famrel: Int(columns[23]) ?? 0,
//            freetime: Int(columns[24]) ?? 0,
//            goout: Int(columns[25]) ?? 0,
//            Dalc: Int(columns[26]) ?? 0,
//            Walc: Int(columns[27]) ?? 0,
//            health: Int(columns[28]) ?? 0,
//            absences: Int(columns[29]) ?? 0,
//            G1: Int(columns[30]) ?? 0,
//            G2: Int(columns[31]) ?? 0,
//            G3: Int(columns[32]) ?? 0
//            // ... Map other fields similarly
//        )
//
//        // Update the properties representing the sum of specific columns
//        studentData.totalAge += studentData.age
//        studentData.totalMedu += studentData.Medu
//        studentData.totalFedu += studentData.Fedu
//        studentData.totalFailures += studentData.failures
//        studentData.totalTravelTime += studentData.traveltime
//        // ... Update other properties for other columns
//
//        return studentData
//    }
//}

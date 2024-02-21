//
//  PredictedCGPAView.swift
//  SPPA
//
//  Created by Shiv Mistry on 30/11/23.
//
//import SwiftUI
//import CoreML
//
//struct PredictedCGPAView: View {
//    
//    // Function to make predictions using the CoreML model
//    func predictUsingCoreML(age: Double, Medu: Double, studytime: Double, failures: Double, goout: Double, health: Double, absences: Double, G1: Double, G2: Double, sex_enc: Double, higher_enc: Double) -> Double? {
//        do {
//            // Load the CoreML model
//            let model = try SPPA(configuration: MLModelConfiguration())
//            
//            // Create an input dictionary
//            let input = SPPAInput(age: age, Medu: Medu, studytime: studytime, failures: failures, goout: goout, health: health, absences: absences, G1: G1, G2: G2, sex_enc: sex_enc, higher_enc: higher_enc)
//            
//            // Make a prediction
//            let prediction = try model.prediction(input: input)
//            
//            // Get the output
//            let output = prediction.G3
//            return output
//        } catch {
//            print("Error: Unable to load or make prediction with the CoreML model.")
//            return nil
//        }
//    }
//
//    var body: some View {
//        // Example usage
//        let randomAge = Double.random(in: 15...20)
//        let randomMedu = Double.random(in: 0...4)
//        let randomStudyTime = Double.random(in: 1...4)
//        let randomFailures = Double.random(in: 0...2)
//        let randomGoout = Double.random(in: 1...5)
//        let randomHealth = Double.random(in: 1...5)
//        let randomAbsences = Double.random(in: 0...30)
//        let randomG1 = Double.random(in: 0...20)
//        let randomG2 = Double.random(in: 0...20)
//        let randomSexEnc = Double.random(in: 0...1)
//        let randomHigherEnc = Double.random(in: 0...1)
//
//        if let prediction = predictUsingCoreML(age: randomAge, Medu: randomMedu, studytime: randomStudyTime, failures: randomFailures, goout: randomGoout, health: randomHealth, absences: randomAbsences, G1: randomG1, G2: randomG2, sex_enc: randomSexEnc, higher_enc: randomHigherEnc) {
//            return AnyView(
//                Text("Predicted CGPA: \(String(format: "%.1f", prediction))")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding()
//                    .navigationBarTitle("Prediction Result")
//            )
//        } else {
//            return AnyView(
//                Text("Failed to make a prediction.")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding()
//                    .navigationBarTitle("Prediction Result")
//            )
//        }
//    }
//}
//
//struct PredictedCGPAView_Previews: PreviewProvider {
//    static var previews: some View {
//        PredictedCGPAView()
//            .environment(\.colorScheme, .dark)
//            .previewDevice("iPhone 12 Pro")
//    }
//}
import SwiftUI
import CoreML
import FirebaseFirestore

struct PredictedCGPAView: View {

    @State private var studentData: [String: Any] = [:]

    // Function to make predictions using the CoreML model
    func predictUsingCoreML() -> Double? {
        do {
            // Load the CoreML model
            let model = try SPPA(configuration: MLModelConfiguration())

            // Extract values from fetched data
            let age = studentData["age"] as? Double ?? 0
            let Medu = studentData["Medu"] as? Double ?? 0
            let studytime = studentData["studytime"] as? Double ?? 0
            let failures = studentData["failures"] as? Double ?? 0
            let goout = studentData["goout"] as? Double ?? 0
            let health = studentData["health"] as? Double ?? 0
            let absences = studentData["absences"] as? Double ?? 0
            let G1 = studentData["G1"] as? Double ?? 0
            let G2 = studentData["G2"] as? Double ?? 0
            let sex_enc = studentData["sex_enc"] as? Double ?? 0
            let higher_enc = studentData["higher_enc"] as? Double ?? 0

            // Create an input dictionary
            let input = SPPAInput(age: age, Medu: Medu, studytime: studytime, failures: failures, goout: goout, health: health, absences: absences, G1: G1, G2: G2, sex_enc: sex_enc, higher_enc: higher_enc)

            // Make a prediction
            let prediction = try model.prediction(input: input)

            // Get the output
            let output = prediction.G3
            return output
        } catch {
            print("Error: Unable to load or make prediction with the CoreML model.")
            return nil
        }
    }

    var body: some View {
        VStack {
            if !studentData.isEmpty {
                // Display student data
                List {
                    ForEach(studentData.sorted(by: { $0.key < $1.key }), id: \.0) { key, value in
                        HStack {
                            Text("\(key):")
                            Spacer()
                            Text("\(String(describing: value))")
                        }
                    }
                }

                // Make prediction using CoreML
                if let prediction = predictUsingCoreML() {
                    Text("Predicted CGPA: \(String(format: "%.1f", prediction))")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                } else {
                    Text("Failed to make a prediction.")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                }
            } else {
                // Loading or error state
                Text("Loading student data...")
                    .onAppear(perform: loadData)
                    .padding()
            }
        }
        .navigationBarTitle("Prediction Result", displayMode: .inline)
    }

    private func loadData() {
        let db = Firestore.firestore()
        let studentsRef = db.collection("student")

        // Replace "student1" with the actual document ID you want to fetch
        let documentID = "student1"

        studentsRef.document(documentID).getDocument { document, error in
            if let error = error {
                print("Error fetching document: \(error)")
            } else if let document = document, document.exists {
                self.studentData = document.data() ?? [:]
                print("Fetched: \(self.studentData)")
            } else {
                print("Document does not exist")
            }
        }
    }
}

struct PredictedCGPAView_Previews: PreviewProvider {
    static var previews: some View {
        PredictedCGPAView()
            .environment(\.colorScheme, .dark)
            .previewDevice("iPhone 12 Pro")
    }
}

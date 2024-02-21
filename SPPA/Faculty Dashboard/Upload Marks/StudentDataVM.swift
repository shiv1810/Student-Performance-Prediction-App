//
//  StudentDataVM.swift
//  SPPA
//
//  Created by Shiv Mistry on 01/12/23.
//

//import Foundation
//import Firebase
//import FirebaseFirestore
//
//class StudentsViewModel: ObservableObject {
//    @Published var students: [Student] = []
//
//    private var db = Firestore.firestore()
//
//    func fetchStudents() {
//        db.collection("students").addSnapshotListener { querySnapshot, error in
//            guard let documents = querySnapshot?.documents else {
//                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//
//            self.students = documents.compactMap { queryDocumentSnapshot in
//                do {
//                    let student = try queryDocumentSnapshot.data(as: Student.self)
//                    return student
//                } catch {
//                    print("Error decoding student: \(error.localizedDescription)")
//                    return nil
//                }
//            }
//        }
//    }
//}
// Import necessary modules
import SwiftUI
import Firebase
import FirebaseFirestore

struct StudentDataVMView: View {
    var body: some View {
        VStack {
            Button("Fetch Student Data") {
                loadData()
            }
        }
        .padding()
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
                let studentData = document.data() ?? [:]
                print("Fetched: \(studentData)")
            } else {
                print("Document does not exist")
            }
        }
    }
}

struct StudentDataVM: PreviewProvider {
    static var previews: some View {
        StudentDataVMView()
    }
}

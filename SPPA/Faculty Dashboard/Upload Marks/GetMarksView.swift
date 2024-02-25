//
//  GetMarksView.swift
//  SPPA
//
//  Created by Shiv Mistry on 25/02/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore


struct UserData: Codable {
    var user_id: String
    var document_id: DocumentReference?
}

struct DivAData: Codable {
    var school: String
    var sex: String
    var age: Int
    var address: String
    var famsize: String
    var Pstatus: String
    var Medu: Int
    var Fedu: Int
    var Mjob: String
    var Fjob: String
    var reason: String
    var guardian: String
    var traveltime: Int
    var studytime: Int
    var failures: Int
    var schoolsup: String
    var famsup: String
    var paid: String
    var activities: String
    var nursery: String
    var higher: String
    var internet: String
    var romantic: String
    var famrel: Int
    var freetime: Int
    var goout: Int
    var Dalc: Int
    var Walc: Int
    var health: Int
    var absences: Int
    var G1: Int
    var G2: Int
    var G3: Int
}
func fetchUserDataAndDivAData(completion: @escaping (UserData?, DivAData?, Error?) -> Void) {
    if let currentUser = Auth.auth().currentUser {
        let db = Firestore.firestore()
        let usersCollection = db.collection("users")
        let divACollection = db.collection("Div-A")

        usersCollection.document(currentUser.uid).getDocument { userDocumentSnapshot, userError in
            if let userError = userError {
                completion(nil, nil, userError)
                return
            }

            guard let userDocument = userDocumentSnapshot, userDocument.exists else {
                completion(nil, nil, NSError(domain: "YourAppErrorDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "User document not found"]))
                return
            }

            do {
                var userData = try userDocument.data(as: UserData.self)

                guard let documentID = userData.document_id else {
                    completion(nil, nil, NSError(domain: "YourAppErrorDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "Document ID not found in user data"]))
                    return
                }

                // Convert the document_id String to DocumentReference
                let documentReference = db.document("Div-A/\(documentID)")

                documentReference.getDocument { documentSnapshot, documentError in
                    if let documentError = documentError {
                        completion(nil, nil, documentError)
                        return
                    }

                    guard let documentSnapshot = documentSnapshot, documentSnapshot.exists else {
                        completion(nil, nil, NSError(domain: "YourAppErrorDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "Referenced document not found"]))
                        return
                    }

                    do {
                        let divAData = try documentSnapshot.data(as: DivAData.self)
                        completion(userData, divAData, nil)
                    } catch {
                        completion(nil, nil, error)
                    }
                }
            } catch {
                completion(nil, nil, error)
            }
        }
    } else {
        completion(nil, nil, NSError(domain: "YourAppErrorDomain", code: 401, userInfo: [NSLocalizedDescriptionKey: "No user is signed in"]))
    }
}


struct GetMarksView: View {
    @State private var userData: UserData?
    @State private var divAData: DivAData?
    @State private var signInError: Error?

    var body: some View {
        VStack {
            if let userData = userData, let divAData = divAData {
                Text("Fetched User Data: \(userData.user_id)")
                Text("Fetched Div-A Data: \(divAData.school)")
            } else if let error = signInError {
                Text("Error signing in: \(error.localizedDescription)")
            } else {
                Button("Sign In", action: signIn)
            }
        }
        .onAppear {
            // Check if a user is already signed in
            if let currentUser = Auth.auth().currentUser {
                // If signed in, fetch user and Div-A data
                fetchUserDataAndDivAData { fetchedUserData, fetchedDivAData, fetchedError in
                    userData = fetchedUserData
                    divAData = fetchedDivAData
                    signInError = fetchedError
                }
            }
        }
    }

    private func signIn() {
        // Sign in using Firebase Authentication
        Auth.auth().signInAnonymously { (authResult, error) in
            if let error = error {
                print("Error signing in anonymously: \(error.localizedDescription)")
                signInError = error
            } else if let user = authResult?.user {
                // If sign-in is successful, fetch user and Div-A data
                fetchUserDataAndDivAData { fetchedUserData, fetchedDivAData, fetchedError in
                    userData = fetchedUserData
                    divAData = fetchedDivAData
                    signInError = fetchedError
                }
            }
        }
    }
}

struct GetMarksView_Previews: PreviewProvider {
    static var previews: some View {
        GetMarksView()
    }
}

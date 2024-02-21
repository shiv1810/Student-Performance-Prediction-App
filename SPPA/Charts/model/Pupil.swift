//
//  Customer.swift
//  BookstoreStategist
//
//  Created by Shiv Mistry on 04/02/24.
//

import Foundation

struct Customer: Identifiable {
    let id: UUID
    let name: String
    let age: Int
    let favoriteGenre: String
    
    static var example = Customer(id: UUID(),
                                  name: "Customer 1",
                                  age: 30,
                                  favoriteGenre: "Fiction")
    static var examples = [
        Customer(id: UUID(), name: "Customer 1", age: 30, favoriteGenre: "Fiction"),
        Customer(id: UUID(), name: "Customer 2", age: 25, favoriteGenre: "Non-fiction"),
        Customer(id: UUID(), name: "Customer 3", age: 35, favoriteGenre: "Fiction"),
        Customer(id: UUID(), name: "Customer 4", age: 28, favoriteGenre: "Fiction"),
        Customer(id: UUID(), name: "Customer 5", age: 32, favoriteGenre: "Non-fiction"),
        Customer(id: UUID(), name: "Customer 6", age: 29, favoriteGenre: "Fiction"),
        Customer(id: UUID(), name: "Customer 7", age: 31, favoriteGenre: "Non-fiction"),
        Customer(id: UUID(), name: "Customer 8", age: 33, favoriteGenre: "Fiction"),
        Customer(id: UUID(), name: "Customer 9", age: 27, favoriteGenre: "Non-fiction"),
        Customer(id: UUID(), name: "Customer 10", age: 36, favoriteGenre: "Fiction")
    ]
}
import Foundation

struct Pupil: Identifiable {
    let id: UUID
    let name: String
    let age: Int
    let favoriteComputerScienceSubject: String
    
    static var example = Pupil(id: UUID(),
                               name: "Student 1",
                               age: 20,
                               favoriteComputerScienceSubject: "Algorithms")
    
    static var examples = [
        Pupil(id: UUID(), name: "Student 1", age: 20, favoriteComputerScienceSubject: "Algorithms"),
        Pupil(id: UUID(), name: "Student 2", age: 22, favoriteComputerScienceSubject: "Data Structures"),
        Pupil(id: UUID(), name: "Student 3", age: 21, favoriteComputerScienceSubject: "Programming Languages"),
        Pupil(id: UUID(), name: "Student 4", age: 23, favoriteComputerScienceSubject: "Databases"),
        Pupil(id: UUID(), name: "Student 5", age: 20, favoriteComputerScienceSubject: "Software Engineering"),
        Pupil(id: UUID(), name: "Student 6", age: 22, favoriteComputerScienceSubject: "Artificial Intelligence"),
        Pupil(id: UUID(), name: "Student 7", age: 21, favoriteComputerScienceSubject: "Algorithms"),
        Pupil(id: UUID(), name: "Student 8", age: 23, favoriteComputerScienceSubject: "Programming Languages"),
        Pupil(id: UUID(), name: "Student 9", age: 20, favoriteComputerScienceSubject: "Databases"),
        Pupil(id: UUID(), name: "Student 10", age: 22, favoriteComputerScienceSubject: "Software Engineering")
    ]
}

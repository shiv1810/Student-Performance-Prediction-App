//
//  BookCategory.swift
//  BookstoreStategist
//
//  Created by Shiv Mistry on 04/02/24.
//

import Foundation


enum BookCategory: String, Identifiable, CaseIterable {
    case fiction
    case biography
    case children
    case computerScience
    case fantasy
    case business
  
    
    var id: Self { return self }
    
    var displayName: String {
        switch self {
            case .fiction:
                "Fiction"
            case .biography:
                "Biography"
            case .children:
                "Children Books"
            case .computerScience:
                "Computer Science"
            case .fantasy:
                "Fantasy"
            case .business:
                "Business"
        }
    }
}

import Foundation

enum ComputerScienceSubject: String, Identifiable, CaseIterable {
    case algorithms
    case dataStructures
    case programmingLanguages
    case databases
    case softwareEngineering
    case artificialIntelligence
    
    var id: Self { return self }
    
    var displayName: String {
        switch self {
            case .algorithms:
                return "Algorithms"
            case .dataStructures:
                return "Data Structures"
            case .programmingLanguages:
                return "Programming Languages"
            case .databases:
                return "Databases"
            case .softwareEngineering:
                return "Software Engineering"
            case .artificialIntelligence:
                return "Artificial Intelligence"
        }
    }
}

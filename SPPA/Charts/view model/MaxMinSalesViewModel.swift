//
//  MaxMinSalesViewModel.swift
//  BookstoreStategist
//
//  Created by Shiv Mistry on 04/02/24.
//

import Foundation

struct SalesByWeekDay: Identifiable {
    let dayNumber: Int
    let minSales: Int
    let maxSales: Int
    let averageSales: Double
    var id: Int { return dayNumber }
}

class MaxMinSalesViewModel: ObservableObject {
    
    @Published var salesData = [Sale]()
    
    var salesByWeekday: [(number: Int, sales: [Sale])] {
        let salesByWeekday = salesGroupedByWeekday(sales: salesData).map {
            (number: $0.key, sales: $0.value)
        }
        
        return salesByWeekday.sorted { $0.number < $1.number }
    }
    
    func salesGroupedByWeekday(sales: [Sale]) -> [Int: [Sale]] {
        var salesByWeekday: [Int: [Sale]] = [:]

        let calendar = Calendar.current
        for sale in sales {
            let weekday = calendar.component(.weekday, from: sale.saleDate)
            if salesByWeekday[weekday] != nil {
                salesByWeekday[weekday]!.append(sale)
            } else {
                salesByWeekday[weekday] = [sale]
            }
        }

        return salesByWeekday
    }
    
    static var preview: SalesViewModel {
        let vm = SalesViewModel()
       // vm.salesData = Sale.threeMonthsExamples
        vm.salesData = Sale.higherWeekendThreeMonthsExamples
        vm.books = Book.examples
        return vm
    }
}

import Foundation

struct MarksByWeekDay: Identifiable {
    let dayNumber: Int
    let minMarks: Int
    let maxMarks: Int
    let averageMarks: Double
    var id: Int { return dayNumber }
}

class MaxMinMarksViewModel: ObservableObject {
    
    @Published var marksData = [Mark]()
    
    var marksByWeekday: [(number: Int, marks: [Mark])] {
        let marksByWeekday = marksGroupedByWeekday(marks: marksData).map {
            (number: $0.key, marks: $0.value)
        }
        
        return marksByWeekday.sorted { $0.number < $1.number }
    }
    
    func marksGroupedByWeekday(marks: [Mark]) -> [Int: [Mark]] {
        var marksByWeekday: [Int: [Mark]] = [:]

        let calendar = Calendar.current
        for mark in marks {
            let weekday = calendar.component(.weekday, from: mark.examDate)
            if marksByWeekday[weekday] != nil {
                marksByWeekday[weekday]!.append(mark)
            } else {
                marksByWeekday[weekday] = [mark]
            }
        }

        return marksByWeekday
    }
    
    static var preview: MaxMinMarksViewModel {
        let vm = MaxMinMarksViewModel()
        // vm.marksData = Mark.threeMonthsExamples
        vm.marksData = Mark.higherWeekendThreeMonthsExamples
        return vm
    }
}

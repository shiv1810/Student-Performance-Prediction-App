//
//  AttendanceView.swift
//  SPPA
//
//  Created by Shiv Mistry on 24/02/24.
//
import SwiftUI
import Charts

struct AttendanceView: View {
    
    private var coffeeSales = [
        (name: "Americano", count: 120),
        (name: "Cappuccino", count: 234),
        (name: "Espresso", count: 62),
        (name: "Latte", count: 625),
        (name: "Mocha", count: 320),
        (name: "Affogato", count: 50)
    ]
    
    var body: some View {
        Chart {
            ForEach(coffeeSales, id: \.name) { coffee in
                
                SectorMark(
                    angle: .value("Cup", coffee.count)
                )
                .foregroundStyle(by: .value("Type", coffee.name))
            }
        }
        .frame(height: 500)
    }
}

struct AttendanceView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceView()
    }
}
    

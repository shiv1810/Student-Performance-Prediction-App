//
//  TimeTable View.swift
//  SPPA
//
//  Created by Shiv Mistry on 24/02/24.
//
import SwiftUI
import SwiftUICalendar

struct TimeTable_View: View {
    let controller = CalendarController()
    var informations = [YearMonthDay: [(String, Color)]]()
    @State var focusDate: YearMonthDay? = nil
    @State var focusInfo: [(String, Color)]? = nil
    init() {
        var date = YearMonthDay.current
        informations[date] = []
        informations[date]?.append(("08:00 AM - 09:30 AM\nClass 101: AI", Color.orange))
        informations[date]?.append(("10:00 AM - 11:30 AM\nClass 102: ML", Color.blue))

        date = date.addDay(value: 1)
        informations[date] = []
        informations[date]?.append(("09:00 AM - 10:30 AM\nClass 103: DBMS", Color.pink))
        informations[date]?.append(("11:00 AM - 12:30 PM\nClass 104: Networking", Color.green))

        date = date.addDay(value: 1)
        informations[date] = []
        informations[date]?.append(("08:30 AM - 10:00 AM\nClass 105: Web Dev", Color.red))
        informations[date]?.append(("10:30 AM - 12:00 PM\nClass 106: Cybersecurity", Color.purple))

        date = date.addDay(value: 1)
        informations[date] = []
        informations[date]?.append(("09:00 AM - 10:30 AM\nClass 107: Mobile App", Color.orange))
        informations[date]?.append(("11:00 AM - 12:30 PM\nClass 108: Data Science", Color.blue))

        date = date.addDay(value: 1)
        informations[date] = []
        informations[date]?.append(("08:00 AM - 09:30 AM\nClass 109: Software Engg", Color.pink))
        informations[date]?.append(("10:00 AM - 11:30 AM\nClass 110: AI", Color.green))

        date = date.addDay(value: 1)
        informations[date] = []
        informations[date]?.append(("Weekend", Color.gray))

        date = date.addDay(value: 1)
        informations[date] = []
        informations[date]?.append(("Weekend", Color.gray))
    }


    var body: some View {
        GeometryReader { reader in
            VStack {
                HStack(alignment: .center, spacing: 0) {
                                    Button("Prev") {
                                        controller.scrollTo(controller.yearMonth.addMonth(value: -1), isAnimate: true)
                                    }
                                    .padding(8)
                                    Spacer()
                                    Text("\(controller.yearMonth.monthShortString), \(String(controller.yearMonth.year))")
                                        .font(.title)
                                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                                    Spacer()
                                    Button("Next") {
                                        controller.scrollTo(controller.yearMonth.addMonth(value: 1), isAnimate: true)
                                    }
                                    .padding(8)
                                }
                CalendarView(controller, header: { week in
                    GeometryReader { geometry in
                        Text(week.shortString)
                            .font(.subheadline)
                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    }
                }, component: { date in
                    GeometryReader { geometry in
                        VStack(alignment: .leading, spacing: 2) {
                            if date.isToday {
                                Text("\(date.day)")
                                    .font(.system(size: 10, weight: .bold, design: .default))
                                    .padding(4)
                                    .foregroundColor(.white)
                                    .background(Color.red.opacity(0.95))
                                    .cornerRadius(14)
                            } else {
                                Text("\(date.day)")
                                    .font(.system(size: 10, weight: .light, design: .default))
                                    .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                    .foregroundColor(getColor(date))
                                    .padding(4)
                            }
                            if let infos = informations[date] {
                                ForEach(infos.indices) { index in
                                    let info = infos[index]
                                    if focusInfo != nil {
                                        Rectangle()
                                            .fill(info.1.opacity(0.75))
                                            .frame(width: geometry.size.width, height: 4, alignment: .center)
                                            .cornerRadius(2)
                                            .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                    } else {
                                        Text(info.0)
                                            .lineLimit(1)
                                            .foregroundColor(.white)
                                            .font(.system(size: 8, weight: .bold, design: .default))
                                            .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
                                            .frame(width: geometry.size.width, alignment: .center)
                                            .background(info.1.opacity(0.75))
                                            .cornerRadius(4)
                                            .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                    }
                                }
                            }
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                        .border(.green.opacity(0.8), width: (focusDate == date ? 1 : 0))
                        .cornerRadius(2)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation {
                                if focusDate == date {
                                    focusDate = nil
                                    focusInfo = nil
                                } else {
                                    focusDate = date
                                    focusInfo = informations[date]
                                }
                            }
                        }
                    }
                })
                if let infos = focusInfo {
                    List(infos.indices, id: \.self) { index in
                        let info = infos[index]
                        HStack(alignment: .center, spacing: 0) {
                            Circle()
                                .fill(info.1.opacity(0.75))
                                .frame(width: 12, height: 12)
                            Text(info.0)
                                .padding(.leading, 8)
                        }
                    }
                    .frame(width: reader.size.width, height: 160, alignment: .center)
                }
            }
        }
        .preferredColorScheme(.dark) // Set dark appearance
    }

    private func getColor(_ date: YearMonthDay) -> Color {
        if date.dayOfWeek == .sun {
            return Color.pink
        } else if date.dayOfWeek == .sat {
            return Color.blue
        } else {
            return Color.white
        }
    }
}



#Preview {
    TimeTable_View()
}

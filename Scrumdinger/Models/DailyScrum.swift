//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/9/23.
//

import Foundation


struct DailyScrum: Identifiable {
    var id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}


extension DailyScrum {
    static let sampleDate: [DailyScrum] = [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["katie", "Jorge", "Andrea"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "web dev", attendees: ["Chella", "manolo", "vanessa"], lengthInMinutes: 6, theme: .poppy)
    ]
}

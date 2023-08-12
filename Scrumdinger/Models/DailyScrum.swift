//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/9/23.
//

import Foundation


struct DailyScrum: Identifiable, Codable {
    var id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinitesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        var id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}


extension DailyScrum {
    static let sampleData: [DailyScrum] = [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon"], lengthInMinutes: 1, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["katie", "Jorge", "Andrea"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "web dev", attendees: ["Chella", "manolo", "vanessa"], lengthInMinutes: 6, theme: .poppy)
    ]
}

//
//  History.swift
//  Scrumdinger
//
//  Created by g1alexander on 8/10/23.
//

import Foundation

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    
//    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
//        self.id = id
//        self.title = title
//        self.attendees = attendees.map { Attendee(name: $0) }
//        self.lengthInMinutes = lengthInMinutes
//        self.theme = theme
//    }
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]){
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}

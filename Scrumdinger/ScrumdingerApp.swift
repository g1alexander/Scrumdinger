//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/7/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleDate)
        }
    }
}

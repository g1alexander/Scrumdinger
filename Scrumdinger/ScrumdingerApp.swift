//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/7/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleDate
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}

//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/7/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}

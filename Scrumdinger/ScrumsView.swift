//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/15/23.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar{
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    // preview with interactive UI
    struct Container: View {
        @State var data = DailyScrum.sampleDate
        
        var body: some View {
           ScrumsView(scrums: $data)
        }
     }
    
    static var previews: some View {
        Container()
    }
}

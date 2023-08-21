//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/15/23.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: ()->Void
    
    var body: some View {
        Navigation {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar{
                Button(action: { isPresentingNewScrumView = true } ) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView){
            NewScrumSheet(isPresentingNewScrumView: $isPresentingNewScrumView, scrums: $scrums)
        }
        .onChange(of: scenePhase){ phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    // preview with interactive UI
    struct Container: View {
        @State var data = DailyScrum.sampleData
        
        var body: some View {
           ScrumsView(scrums: $data, saveAction: {})
        }
     }
    
    static var previews: some View {
        Container()
    }
}

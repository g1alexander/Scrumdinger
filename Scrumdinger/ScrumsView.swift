//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/15/23.
//

import SwiftUI

struct ScrumsView: View {
    
    let scrums: [DailyScrum]
    
    var body: some View {
        List(scrums) { scrum in
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var data = DailyScrum.sampleDate
    
    static var previews: some View {
        ScrumsView(scrums: data)
    }
}

//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by g1alexander on 8/4/23.
//

import SwiftUI

struct NewScrumSheet: View {
    @Binding var isPresentingNewScrumView: Bool
    @Binding var scrums: [DailyScrum]
    @State private var newScrum = DailyScrum.emptyScrum
    
    var body: some View {
        Navigation {
            DetailEditView(scrum: $newScrum)
                .toolbar{
                    ToolbarItem (placement: .cancellationAction){
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction){
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }

                }
        }
        
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(isPresentingNewScrumView: .constant(true), scrums: .constant(DailyScrum.sampleData))
    }
}

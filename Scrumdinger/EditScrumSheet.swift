//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by g1alexander on 8/4/23.
//

import SwiftUI

struct EditScrumSheet: View {
    @Binding var isPresentingEditView: Bool
    @Binding var scrum: DailyScrum
    @Binding var editingScrum: DailyScrum
    
    var body: some View {
        Navigation {
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(scrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel") {
                            isPresentingEditView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button("Done") {
                            isPresentingEditView = false
                            scrum = editingScrum
                        }
                    }
                }
        }
    }
}

struct EditScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditScrumSheet(isPresentingEditView: .constant(true), scrum: .constant(DailyScrum.sampleData[0]), editingScrum: .constant(DailyScrum.sampleData[0]))
    }
}

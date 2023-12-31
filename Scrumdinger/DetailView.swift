//
//  DetailView.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/16/23.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    
    @State private var isPresentingEditView = false
    
    var body: some View {
        List{
            Section( header: Text(scrum.title) ){
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                    .foregroundColor(.accentColor)
                }
                
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            
            Section(header: Text("History")) {
                if (scrum.history.isEmpty) {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                else{
                    ForEach(scrum.history) { history in
                        NavigationLink(destination: HistoryView(history: history)) {
                            HStack{
                                Image(systemName: "calendar")
                                Text(history.date, style: .date)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit") {
                isPresentingEditView = true
                editingScrum = scrum
            }
            .accessibilityLabel("Edit Scrum")
        }
        .sheet(isPresented: $isPresentingEditView){
           EditScrumSheet(isPresentingEditView: $isPresentingEditView, scrum: $scrum, editingScrum: $editingScrum)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    
    static var previews: some View {
        Navigation{
            DetailView(scrum: .constant(scrum))
        }
    }
}

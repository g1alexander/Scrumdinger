//
//  DetailView.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/16/23.
//

import SwiftUI

struct DetailView: View {
    
    let scrum: DailyScrum
    
    @State private var isPresentingEditView = false
    
    var body: some View {
        List{
            Section( header: Text(scrum.title) ){
                NavigationLink(destination: MeetingView()) {
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
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button(action: { isPresentingEditView = true }) {
                Text("Edit")
            }
            .accessibilityLabel("Edit Scrum")
        }
        .sheet(isPresented: $isPresentingEditView){
            NavigationStack {
                DetailEditView()
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
                            }
                        }
                    }
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleDate[0]
    
    static var previews: some View {
        NavigationStack{
            DetailView(scrum: scrum)
        }
    }
}

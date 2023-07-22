//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/20/23.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section( header: Text("Meeting Info") ){
                
                TextField("Title", text: $scrum.title)
                
                HStack{
                    Slider(value: $scrum.lengthInMinitesAsDouble, in: 5...30, step: 1){
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePickerView(selection: $scrum.theme)
            }
            
            Section(header: Text("Attendees") ){
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete{ indeces in
                    scrum.attendees.remove(atOffsets: indeces)
                }
                
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    
                    Button(action: {
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            
                            newAttendeeName = ""
                        }
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add Attendee")
                    })
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}

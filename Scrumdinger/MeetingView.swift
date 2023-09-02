//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/7/23.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                
                MeetingTimerView(speakers: scrumTimer.speakers, theme: scrum.theme)
                
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
                    
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear{
            startScrum()
        }
        .onDisappear{
            endScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func startScrum(){
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.startScrum()
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            
            player.play()
        }
    }
    
    private func endScrum(){
        scrumTimer.stopScrum()
        let newHistory = History(attendees: scrum.attendees)
        
        scrum.history.insert(newHistory, at: 0)
    }
}

struct MeetingView_Previews: PreviewProvider {
    // preview with interactive UI
    struct Container: View {
        @State var data = DailyScrum.sampleData[0]
        
        var body: some View {
            MeetingView(scrum: $data)
        }
    }
    
    static var previews: some View {
        Container()
    }
}

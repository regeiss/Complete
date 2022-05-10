//
//  MeetingTimer.swift
//  Scrumdinger
//
//  Created by Roberto Edgar Geiss on 10/05/22.
//

import SwiftUI

struct MeetingTimerView: View
{
    let theme: Theme
    let speakers: [ScrumTimer.Speaker]
    
    private var currentSpeaker: String
    {
        speakers.first(where: { !$0.isCompleted})?.name ?? "Someone"
    }
    
    var body: some View
    {
         Circle()
             .strokeBorder(lineWidth: 24)
             .overlay {
                 VStack
                 {
                     Text(currentSpeaker)
                         .font(.title)
                     Text("is speaking")
                 }
                 .accessibilityElement(children: .combine)
                 .foregroundStyle(theme.accentColor)
             }
             .overlay  {
                 ForEach(speakers) { speaker in
                     if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                         SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                             .rotation(Angle(degrees: -90))
                             .stroke(theme.mainColor, lineWidth: 12)
                     }
                 }
             }
             .padding(.horizontal)
     }
 }

struct MeetingTimer_Previews: PreviewProvider
{
    static var speakers: [ScrumTimer.Speaker]
    {
        [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
    }
    static var previews: some View
    {
        MeetingTimerView(theme: .yellow, speakers: speakers)
    }
}

//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Roberto Edgar Geiss on 01/05/22.
//

import SwiftUI

struct ScrumsView: View
{
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentetingNewScrumView: Bool = false
    @State private var newScrumData = DailyScrum.Data()
    let saveAction: () -> Void
    
    var body: some View
    {
        List
        {
            ForEach($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum))
                {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: { isPresentetingNewScrumView = true})
            {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }.sheet(isPresented: $isPresentetingNewScrumView)
        {
            NavigationView
            {
                DetailEditView(data: $newScrumData)
                    .toolbar { ToolbarItem(placement: .cancellationAction) { Button("Dismiss") { isPresentetingNewScrumView = false
                        newScrumData = DailyScrum.Data()}
                    }
                        ToolbarItem(placement: .confirmationAction) { Button("Add") { let newScrum = DailyScrum(data: newScrumData); isPresentetingNewScrumView = false
                            scrums.append(newScrum) }}
                    }
            }.onChange(of: scenePhase)
            { phase in
                if phase == .inactive { saveAction()}
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
        }
    }
}


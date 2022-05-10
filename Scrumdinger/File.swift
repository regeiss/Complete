//
//  File.swift
//  Scrumdinger
//
//  Created by Roberto Edgar Geiss on 07/05/22.
//
//import SwiftUI
//
//struct ScrumsView1: View {
//    @Binding var scrums: [DailyScrum]
//    @Environment(\.scenePhase) private var scenePhase
//    @State private var isPresentingNewScrumView = false
//    @State private var newScrumData = DailyScrum.Data()
//    let saveAction: ()->Void
//    
//    var body: some View {
//        List {
//            ForEach($scrums) { $scrum in
//                NavigationLink(destination: DetailView(scrum: $scrum)) {
//                    CardView(scrum: scrum)
//                }
//                .listRowBackground(scrum.theme.mainColor)
//            }
//        }
//        .navigationTitle("Daily Scrums")
//        .toolbar {
//            Button(action: {
//                isPresentingNewScrumView = true
//            }) {
//                Image(systemName: "plus")
//            }
//            .accessibilityLabel("New Scrum")
//        }
//        .sheet(isPresented: $isPresentingNewScrumView) {
//            NavigationView {
//                DetailEditView(data: $newScrumData)
//                    .toolbar {
//                        ToolbarItem(placement: .cancellationAction) {
//                            Button("Dismiss") {
//                                isPresentingNewScrumView = false
//                                newScrumData = DailyScrum.Data()
//                            }
//                        }
//                        ToolbarItem(placement: .confirmationAction) {
//                            Button("Add") {
//                                let newScrum = DailyScrum(data: newScrumData)
//                                scrums.append(newScrum)
//                                isPresentingNewScrumView = false
//                                newScrumData = DailyScrum.Data()
//                            }
//                        }
//                    }
//            }
//        }
//        .onChange(of: scenePhase) { phase in
//            if phase == .inactive { saveAction() }
//        }
//    }
//}
//
//struct ScrumsView1_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ScrumsView1(scrums: .constant(DailyScrum.sampleData), saveAction: {})
//        }
//    }
//}

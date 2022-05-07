/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

@main
struct ScrumdingerApp: App
{
    @StateObject private var store = ScrumStore()
    
    var body: some Scene
    {
        WindowGroup
        {
            NavigationView
            {
                ScrumsView(scrums: $store.scrums)
            }.onAppear
            {
                ScrumStore.load
                {
                    result in
                    switch result
                    {
                        case .failure(let error):
                            fatalError(error.localizedDescription)
                        case .success(let scrums):
                            store.scrums = scrums
                    }
                }
            }
        }
    }
}

//
//  Personal3DViewerApp.swift
//  Personal3DViewer
//
//  Created by David Potashnik on 7/23/24.
//

import SwiftUI

@main
struct Personal3DViewerApp: App {
    
    @StateObject var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
                ContentView()
                    .environmentObject(authentication)

            } else {
                LoginView()
                    .environmentObject(authentication)
            }
        }
    }
}

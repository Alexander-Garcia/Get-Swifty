//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Alexander Garcia on 4/30/24.
//

import SwiftUI

@main
// The structure’s body property returns one or more scenes, which in turn provide content for display. The @main attribute identifies the app’s entry point.
struct LandmarksApp: App {
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}

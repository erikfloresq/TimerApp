//
//  TimerAppApp.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 19/9/21.
//

import SwiftUI

@main
struct TimerAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

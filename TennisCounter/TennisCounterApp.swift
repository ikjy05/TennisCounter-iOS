//
//  TennisCounterApp.swift
//  TennisCounter
//
//  Created by AppleBoy on 2021/12/06.
//

import SwiftUI
import Firebase
import AppTrackingTransparency

@main
struct TennisCounterApp: App {
    
    var shared = SharedViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(shared)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    //                                    UIApplication.shared.applicationIconBadgeNumber = 0
                    ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                        // Tracking authorization completed. Start loading ads here.
                    })
                    
                }
        }
    }
}

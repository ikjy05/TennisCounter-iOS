//
//  TennisCounterApp.swift
//  TennisCounter
//
//  Created by AppleBoy on 2021/12/06.
//

import SwiftUI
import Firebase
import AppTrackingTransparency
import AdSupport
import GoogleMobileAds

@main
struct TennisCounterApp: App {
    
    var shared = SharedViewModel()
    
    init() {
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(shared)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    //                                    UIApplication.shared.applicationIconBadgeNumber = 0
                    ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                        // Tracking authorization completed. Start loading ads here.
                        print(ASIdentifierManager.shared().advertisingIdentifier)
                    })
                    
                }
        }
    }
}

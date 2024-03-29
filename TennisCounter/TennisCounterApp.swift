//
//  TennisCounterApp.swift
//  TennisCounter
//
//  Created by AppleBoy on 2021/12/06.
//

import SwiftUI
import Firebase

@main
struct TennisCounterApp: App {
    
    var orientationInfo = OrientationInfo()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(orientationInfo)
        }
    }
}

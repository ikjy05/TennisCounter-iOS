//
//  TennisCounterApp.swift
//  TennisCounter
//
//  Created by AppleBoy on 2021/12/06.
//

import SwiftUI

@main
struct TennisCounterApp: App {
    
    var shared = SharedViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(shared)
        }
    }
}

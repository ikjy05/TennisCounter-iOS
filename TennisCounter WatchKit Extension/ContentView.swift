//
//  ContentView.swift
//  TennisCounter WatchKit Extension
//
//  Created by macbook air on 2021/12/06.
//

import SwiftUI

struct ContentView: View {

    @State var our = Team()
    @State var your = Team(isYou: true)
    @GestureState var press = false
    
    var body: some View {
         
        GeometryReader { geometry in
            ZStack {
                VStack {
                    TeamView(team: $our, your: $your)
                        .background(Color(.black))
                        .foregroundColor(.white)
                    
                    TeamView(team: $your, your: $our)
                        .background(Color(.white))
                        .foregroundColor(.black)
                }
                VStack {
                    ZStack {
                        Rectangle()
                            .opacity(0.00001)
//                        Spacer()
                            .frame(width: geometry.size.width * 0.4)
                    }
                    .onLongPressGesture {
                        our = Team()
                        your = Team(isYou: true)
                        print("Long touch to reset")
                        WKInterfaceDevice.current().play(.start)
                    }
                    
                }
            }
        }
//
//        VStack {
//            TeamView(team: $our, your: $your)
//                .background(Color(.black))
//                .foregroundColor(.white)
//
//            TeamView(team: $your, your: $our)
//                .background(Color(.white))
//                .foregroundColor(.black)
//        }
//        .onLongPressGesture {
//            our = Team()
//            your = Team(isYou: true)
//            WKInterfaceDevice.current().play(.start)
//        }
//        .gesture(LongPressGesture()
//            .updating($press, body: { currentState, gestureState, transaction in
//                gestureState = currentState
//            })
//        )
//        .scaleEffect(press ? 0.8 : 1)
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//
//  ContentView.swift
//  TennisCounter WatchKit Extension
//
//  Created by macbook air on 2021/12/06.
//

import SwiftUI

struct ContentView: View {

    @State var our = Team(isServe: true)
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
                
                ZStack {
                    Rectangle()
                        .opacity(0.00001)
                    //                        Spacer()
                        .frame(width: geometry.size.width * 0.4)
                    VStack {
                        if your.isServe {
                            Image("ball_white_16")
                        }
                        Spacer()
                        if our.isServe {
                            Image("ball_16")
                        }
                    }
                    
                }
                .onLongPressGesture {
//                    our = Team()
//                    your = Team(isYou: true)
                    our.point = 0
                    your.point = 0
                    our.score = 0
                    your.score = 0
                    print("Long touch to reset")
                    WKInterfaceDevice.current().play(.start)
                }
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onEnded({ value in
                        if value.translation.width < 0 {
                            // left
                        }
                        
                        if value.translation.width > 0 {
                            // right
                        }
                        if value.translation.height < 0 {
                            // up
                            your.isServe = true
                            our.isServe = false
                        }
                        
                        if value.translation.height > 0 {
                            // down
                            your.isServe = false
                            our.isServe = true
                        }
                    }))
                
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

//
//  ContentView.swift
//  TennisCounter
//
//  Created by AppleBoy on 2021/12/06.
//

import SwiftUI

struct ContentView: View {
    @State var your = Team(isYou: true, isServe: true)
    @State var our = Team()

    @EnvironmentObject var orientationInfo: OrientationInfo
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                VStack {
                    AdaptiveView {
                        TeamView(team: $our, your: $your)
                            .background(Color(.black))
                            .foregroundColor(.white)
                        
                        TeamView(team: $your, your: $our)
                            .background(Color(.white))
                            .foregroundColor(.black)
                    }
                    .preferredColorScheme(.dark)
                    
                }

                VStack {
                    Spacer()
                    Banner()
                }
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                
                if orientationInfo.orientation == .portrait {
                    VStack {
                        
                        if your.isServe {
                            Image("ball_white")
                        }
                        Spacer()
                        if our.isServe {
                            Image("ball")
                        }
                    }
                    .padding()
                }
                else {
                    HStack {
                        if your.isServe {
                            Image("ball_white")
                                .padding(.leading, 5)
                        }
                        Spacer()
                        if our.isServe {
                            Image("ball")
                                .padding(.trailing, 5)
                        }
                    }
                    .padding(.top, geometry.safeAreaInsets.bottom)
                }
                
            }
            

        }
        .onLongPressGesture {
            our.point = 0
            your.point = 0
            our.score = 0
            your.score = 0
            print("Long touch to reset")
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


struct AdaptiveView<Content: View>: View {

    @EnvironmentObject var orientationInfo: OrientationInfo

    var content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    
    var body: some View {
        if orientationInfo.orientation == .landscape {
            HStack {
                content
            }
        } else {
            VStack {
                content
            }
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}


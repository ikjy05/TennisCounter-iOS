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
//    @State private var orientation = UIDeviceOrientation.unknown
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
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
                Rectangle()
                    .opacity(0.00001)
                    .frame(width: geometry.size.width * 0.4)
                    .onLongPressGesture {
                        //                    our = Team()
                        //                    your = Team(isYou: true)
                        our.point = 0
                        your.point = 0
                        our.score = 0
                        your.score = 0
                        print("Long touch to reset")
                    }

                VStack {
                    Spacer()
                    Banner()
                }
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                VStack {
                    if your.isServe {
                        Image("ball_white")
                    }
                    Spacer()
                    if our.isServe {
                        Image("ball")
                    }
                }
            }
            

        }
    }
}


struct AdaptiveView<Content: View>: View {
//    @EnvironmentObject var orientationInfo: OrientationInfo
    @EnvironmentObject var shared: SharedViewModel
//    @Environment(\.verticalSizeClass) var verticalSizeClass
//    @Environment(\.sizeCategory) var sizeCategory: ContentSizeCategory
    var content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    
    var body: some View {
//        if verticalSizeClass == .compact {
        if shared.orientation == .landscape {
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

//extension View {
//    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
//        self.modifier(DeviceRotationViewModifier(action: action))
//    }
//}

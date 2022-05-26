//
//  ContentView.swift
//  TennisCounter
//
//  Created by AppleBoy on 2021/12/06.
//

import SwiftUI

struct ContentView: View {
    @State var our = Team()
    @State var your = Team(isYou: true)
//    @State private var orientation = UIDeviceOrientation.unknown
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
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
            .onLongPressGesture {
                our = Team()
                your = Team(isYou: true)                
            }
            .preferredColorScheme(.dark)
            
            
        }
            VStack {
                Spacer()
                Banner()
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

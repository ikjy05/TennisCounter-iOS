//
//  TeamView.swift
//  TennisCounter
//
//  Created by AppleBoy on 2022/03/02.
//

import SwiftUI

struct TeamView: View {

    @EnvironmentObject var orientationInfo: OrientationInfo
    
    let points = ["0", "15", "30", "40", "Ad"]
    let size: CGFloat = 32
    
    @Binding var team: Team
    @Binding var your: Team
        
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                
                Spacer()
                
                if (team.isYou && orientationInfo.orientation == .portrait) ||
                    orientationInfo.orientation == .landscape {
                    Text(String(team.score))
                        .font(.system(size: size, weight: .semibold))
                }
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: { // Down
                        if team.point == 0 {
                            team.point = 4
                            team.score -= 1
                            
                            serveChange()
                        }
                        else {
                            team.point -= 1
                        }
                        
                    }, label: {
                        Image(systemName: "chevron.down.circle")
                    })
                        .buttonStyle(.plain)
    //                    .buttonStyle(BorderedButtonStyle(tint: .clear))
                        .disabled(team.point == 0 && team.score == 0)
                        .simultaneousGesture(
                            LongPressGesture()
                                .onEnded { _ in
                                    team.score = 0
                                    team.point = 0
                                }
                        )
                    
                    Spacer()
                    
                    let width = geometry.size.width * 0.5
                    Text(points[team.point])
                        .font(.system(size: 300))
                        .minimumScaleFactor(0.2)
    //                    .frame(width: 40)
                        .frame(width: width, height: width)

                    Spacer()
                    
                    Button(action: {
                        if team.point < 4 {
                            team.point += 1
                            if team.point == 4, your.point == 4 {
                                your.point = 3
                            }
                        }
                        else {
                            team.score += 1
                            team.point = 0
                            your.point = 0
                            
                            serveChange()
                        }
                    }, label: {
                        Image(systemName: "chevron.up.circle")
                    })
                        .background(Color(.clear))
    //                    .buttonStyle(BorderedButtonStyle(tint: .clear))
                        .buttonStyle(.plain)
                    
                    Spacer()
                }
                .font(.system(size: size))
                
                if !team.isYou && orientationInfo.orientation == .portrait {
                    Text(String(team.score))
                        .font(.system(size: size, weight: .semibold))
                }
                
                Spacer()
            }
        }
    }
    func serveChange() {
        team.isServe = !team.isServe
        your.isServe = !your.isServe
    }
}

//struct TeamView_Previews: PreviewProvider {
//    static var previews: some View {
//        TeamView()
//    }
//}

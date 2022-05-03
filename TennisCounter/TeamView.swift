//
//  TeamView.swift
//  TennisCounter
//
//  Created by AppleBoy on 2022/03/02.
//

import SwiftUI

struct TeamView: View {

    let points = ["0", "15", "30", "40", "Ad"]
    let size: CGFloat = 32
    
    @Binding var team: Team
    @Binding var your: Team
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            if team.isYou {
                Text(String(team.score))
            }
            
            HStack {
                
                Spacer()
                
                Button(action: { // Down
                    if team.point == 0 {
                        team.point = 4
                        team.score -= 1
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
                
                Spacer()
                
                Text(points[team.point])
//                    .frame(width: 40)

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
            
            if !team.isYou {
                Text(String(team.score))
            }
            
            Spacer()
        }
        
    }
    
}

struct Team: Equatable {
    var point = 0
    var score = 0
    var isYou = false
    
}


//struct TeamView_Previews: PreviewProvider {
//    static var previews: some View {
//        TeamView()
//    }
//}

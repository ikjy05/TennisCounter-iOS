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
    
    var body: some View {
        GeometryReader { g in
            
            VStack {
                TeamView(team: $our, your: $your)
                    .frame(height: g.size.height/2)
                    .background(Color(.black))
                    .foregroundColor(.white)
                
                TeamView(team: $your, your: $our)
                    .frame(height: g.size.height/2)
                    .background(Color(.white))
                    .foregroundColor(.black)
//                    .overlay {
                        
//                        Image(systemName: "gobackward")
//                            .foregroundColor(.black)
//                            .offset(y: 44)
                            
                        
//                        Button {
//
//                        } label: {
//                            Image(systemName: "gobackward")
//                        }
                        
                        
//                    }
            }
            .onLongPressGesture {
                our = Team()
                your = Team(isYou: true)
            }
        }
    }
}

struct TeamView: View {

    let points = ["0", "15", "30", "40", "Ad"]
    let size: CGFloat = 32
    
    @Binding var team: Team
    @Binding var your: Team
    
    var body: some View {
        
        VStack {
            
            if team.isYou {
                Text(String(team.score))
            }
            
            HStack {
                
                Button(action: {
                    if team.point > 0 {
                        team.point -= 1
                    }
                }, label: {
                    Image(systemName: "chevron.down.circle")
                })
                    .buttonStyle(BorderedButtonStyle(tint: .clear))
                    .disabled(team.point == 0)
                
                Text(points[team.point])
                    .frame(width: 40)

                
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
                    .buttonStyle(BorderedButtonStyle(tint: .clear))
                
            }
            .font(.system(size: size))
            
            if !team.isYou {
                Text(String(team.score))
            }
            
        }
        
    }
    
}

struct Team: Equatable {
    var point = 0
    var score = 0
    var isYou = false
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

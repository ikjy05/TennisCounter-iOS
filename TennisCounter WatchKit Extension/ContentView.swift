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
            
        VStack {
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
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

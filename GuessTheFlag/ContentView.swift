//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Berserk on 03/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        ZStack {
//            LinearGradient(stops: [
//                Gradient.Stop(color: .white, location: 0.40),
//                Gradient.Stop(color: .black, location: 0.60)
//            ], startPoint: .top, endPoint: .bottom)
            
//            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20.0, endRadius: 200.0)
            
//            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            
            Text("My beautiful red frame")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .padding(50)
                .background(.red.gradient)
        }
        .ignoresSafeArea()

    }
}

#Preview {
    ContentView()
}

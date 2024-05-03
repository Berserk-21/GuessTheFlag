//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Berserk on 03/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        VStack {
            HStack {
                Text("1x1")
                Text("1x2")
                Text("1x3")
            }
            HStack {
                Text("2x1")
                Text("2x2")
                Text("2x3")
            }
            HStack {
                Text("3x1")
                Text("3x2")
                Text("3x3")
            }
        }

    }
}

#Preview {
    ContentView()
}

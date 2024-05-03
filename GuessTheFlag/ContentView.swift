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
            Color.red
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: .infinity)
            Text("My beautiful red frame")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()

    }
}

#Preview {
    ContentView()
}

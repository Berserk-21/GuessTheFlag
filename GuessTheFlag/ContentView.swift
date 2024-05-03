//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Berserk on 03/05/2024.
//

import SwiftUI

struct ContentView: View {

    @State private var showingAlert = false

    var body: some View {
        VStack {
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Please read this.")
            }
        }
    }
}

#Preview {
    ContentView()
}

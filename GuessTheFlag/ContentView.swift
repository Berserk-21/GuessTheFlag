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
            Button("bordered") {
                
            }
            .buttonStyle(.bordered)
            .tint(.primary)
            
            Button("borderedProminent") {
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.yellow)
            
            Button("plain") {
                
            }
            .buttonStyle(.plain)
            .tint(.secondary)
            
            Button("borderless") {
                
            }
            .buttonStyle(.borderless)
            .tint(.mint)
            
            Button {
                print("did tap")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
                    .clipShape(.buttonBorder)
            }
            
            Button {
                print("did tap edit")
            } label: {
                Image(systemName: "pencil")
                    .tint(.white)
            }
            .frame(width: 50.0, height: 50.0)
            .background(Color.gray)
            .clipShape(.buttonBorder)
        }
    }
    
    func executeDelete() {
        print("Delete now !")
    }
}

#Preview {
    ContentView()
}

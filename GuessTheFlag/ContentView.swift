//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Berserk on 03/05/2024.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Properties
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    
    // MARK: - UI

    var body: some View {
        ZStack {
            LinearGradient(colors: [.brown, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Text("Tap the flag of")
                    .foregroundStyle(.white)
                    .font(.subheadline.weight(.heavy))
                Text(countries[correctAnswer])
                    .foregroundStyle(.white)
                    .font(.largeTitle.weight(.semibold))
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                        .clipShape(.rect(cornerRadius: 8.0))
                        .shadow(radius: 5)
                    }
                }
            }
            
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(currentScore)")
            }
        }
    }
    
    // MARK: - Core Methods
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
        } else {
            scoreTitle = "Wrong"
            currentScore -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}

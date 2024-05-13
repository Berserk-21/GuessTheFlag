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
    @State private var showingEndResult = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    private var totalQuestionsNb = 8
    @State private var questionsLeft = 8
    
    @State private var tappedFlagIndex = -1
    private var rotationDegreesValue = 360.0
    
    // MARK: - UI

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                Spacer()
                VStack(spacing: 15) {
                    Text("Tap the flag of")
                        .foregroundStyle(.primary)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundStyle(.primary)
                        .font(.largeTitle.weight(.semibold))
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(countryName: countries[number])
                        }
                        .rotation3DEffect(
                            .degrees(number == tappedFlagIndex ? rotationDegreesValue : 0.0),
                                                  axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    Text("Your score is \(currentScore)")
                }
                .alert("Final result", isPresented: $showingEndResult) {
                    Button("Restart", action: restart)
                } message: {
                    Text("Your final score is \(currentScore) !")
                }
                
                Text("Score: \(currentScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                    .padding(20)
                Spacer()
                Spacer()
            }
        }
    }
    
    // MARK: - Core Methods
    
    private func flagTapped(_ number: Int) {
        
        withAnimation {
            tappedFlagIndex = number
        }
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
        } else {
            scoreTitle = "Wrong, that's the flag of \(countries[number])"
            currentScore -= 1
        }
        
        // Score threshold: 0
        currentScore = max(currentScore, 0)
        
        questionsLeft -= 1
        
        if questionsLeft > 0 {
            showingScore = true
        } else {
            showingEndResult = true
        }
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        tappedFlagIndex = -1
    }
    
    private func restart() {
        
        currentScore = 0
        questionsLeft = totalQuestionsNb
        askQuestion()
    }
}

struct FlagImage: View {
    
    let countryName: String
    
    var body: some View {
        Image(countryName)
        .clipShape(.rect(cornerRadius: 8.0))
        .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}

//
//  MiniGameView.swift
//  BLOOM
//
//  Created by Suhaylah hawsawi on 21/06/1447 AH.
//

import SwiftUI

struct MiniGameView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var question: MiniGameQuestion =
        MiniGameData.allQuestions.randomElement()!
    
    @State private var choices: [String] = []
    @State private var showCorrect = false
    @State private var showWrong = false
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text(String(localized: "Mini Game"))
                .font(.system(size: 50, weight: .bold))
                .foregroundStyle(.black)
            
            // 🟦 Question Image
            Image(question.questionImage)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .shadow(radius: 10)
            
            // 🟡 Image choices
            HStack(spacing: 20) {
                ForEach(choices, id: \.self) { img in
                    Button {
                        checkAnswer(img)
                    } label: {
                        Image(img)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 180)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 6)
                            .scaleEffect(showWrong && img == img ? 0.9 : 1.0)
                    }
                }
            }
            
            if showCorrect {
                VStack(spacing: 12) {
                    Text(String(localized: "Great Job!"))
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.green)
                    
                    Button(String(localized: "Next")) {
                        loadNextQuestion()
                    }
                    .padding()
                    .background(Color.babyBlue)
                    .cornerRadius(20)
                    .foregroundStyle(.white)
                }
            }
            
            Spacer()
            
            Button(String(localized: "Back")) { dismiss() }
                .padding(.top, 20)
        }
        .onAppear {
            loadChoices()
        }
        
    }
    
    
    private func loadChoices() {
        choices = ([question.correctImage] + question.wrongImages).shuffled()
    }
    
    private func loadNextQuestion() {
        question = MiniGameData.allQuestions.randomElement()!
        showCorrect = false
        showWrong = false
        loadChoices()
    }
    
    private func checkAnswer(_ img: String) {
        if img == question.correctImage {
            showCorrect = true
        } else {
            showWrong = true
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        }
    }
}


#Preview {
    MiniGameView()
}

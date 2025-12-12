//
//  MiniGameData.swift
//  BLOOM
//
//  Created by Suhaylah hawsawi on 21/06/1447 AH.
//

struct MiniGameData {
    
    static var allQuestions: [MiniGameQuestion] = [
        
        // 🦷 Brushing teeth
        MiniGameQuestion(
            questionImage: "BT1",
            correctImage: "BT1",
            wrongImages: ["EF2", "WH1"]
        ),
        
        MiniGameQuestion(
            questionImage: "BT2",
            correctImage: "BT2",
            wrongImages: ["SE1", "BK1"]
        ),
        
        // 🍎 Eating food
        MiniGameQuestion(
            questionImage: "EF1",
            correctImage: "EF1",
            wrongImages: ["ST1", "CH2"]
        ),
        
        // Add more the same way...
    ]
}

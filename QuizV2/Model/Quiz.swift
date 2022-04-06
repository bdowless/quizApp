//
//  Quiz.swift
//  QuizV2
//
//  Created by Brandon Dowless on 2/20/22.
//

import Foundation

struct Quiz {
    var questions: [Question]
}

struct Question {
    var text: String
    var answers: [Answer]
}

struct Answer {
    var text: String
    var correct: Bool
}

let racingQuiz = Quiz(questions: questionsArray)

var questionsArray: [Question] = [
    Question(text: "Who is the best Rider in MotoGP", answers: [
        Answer(text: "Rossi", correct: true),
        Answer(text: "Marquez", correct: false),
        Answer(text: "Lorenzo", correct: false),
        Answer(text: "Stoner", correct: false)
    ]),
    
    
    Question(text: "Who is the best Boxer", answers: [
        Answer(text: "Tyson", correct: false),
        Answer(text: "Ali", correct: true),
        Answer(text: "Fraizer", correct: false),
        Answer(text: "Mayweather", correct: false)
    ]),
    
    Question(text: "Who is the best Formula 1 Driver", answers: [
        Answer(text: "Hamilton", correct: false),
        Answer(text: "Senna", correct: true),
        Answer(text: "Shumacher", correct: false),
        Answer(text: "Verstappen", correct: false)
    ]),
    
    Question(text: "Who has won the most races in F1", answers: [
        Answer(text: "Hamilton", correct: true),
        Answer(text: "Verstappen", correct: false),
        Answer(text: "Shumacher", correct: false),
        Answer(text: "Prost", correct: false)
    ]),
    
    Question(text: "Who is the best Formula 1 Driver", answers: [
        Answer(text: "Hamilton", correct: true),
        Answer(text: "Senna", correct: false),
        Answer(text: "Shumacher", correct: false),
        Answer(text: "Verstappen", correct: false)
    ]),
    
    Question(text: "Who is the best Formula 1 Driver", answers: [
        Answer(text: "Hamilton", correct: true),
        Answer(text: "Senna", correct: false),
        Answer(text: "Shumacher", correct: false),
        Answer(text: "Verstappen", correct: false)
    ]),
    
    Question(text: "Who is the best Formula 1 Driver", answers: [
        Answer(text: "Hamilton", correct: true),
        Answer(text: "Senna", correct: false),
        Answer(text: "Shumacher", correct: false),
        Answer(text: "Verstappen", correct: false)
    ])
]





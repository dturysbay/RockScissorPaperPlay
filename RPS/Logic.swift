//
//  Logic.swift
//  RPS
//
//  Created by Dinmukhambet Turysbay on 14.04.2023.
//

import Foundation

let arrayOfChoices: [Choices] = [.rock,.scissors,.paper]

func getRandomValue() -> Choices {
    return arrayOfChoices.randomElement()!
}

enum ScreenState: String{
    case choose = "Choose"
    case change = "Change"
    case openentChoose = "Oponent Choose"
    case showOponentChoice = "Show oponent choice"
    case showResult = "Show Result"
    case multiPlayerOponentChoice = "MultiPlayer Oponent Choice"
}

enum Choices: String, CaseIterable {
    case rock = "🗿"
    case paper = "📃"
    case scissors = "✂️"
    case none = "none"
    
    func beats(_ otherMove: Choices) -> Bool {
        switch (self, otherMove) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return true
        default:
            return false
        }
    }
}

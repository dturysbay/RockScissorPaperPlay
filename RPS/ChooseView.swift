//
//  ChooseView.swift
//  RPS
//
//  Created by Dinmukhambet Turysbay on 15.04.2023.
//

import SwiftUI

struct ChooseView:View{
    @Binding var selfChoice: Choices
    @Binding var screenState: ScreenState
    @Binding var selfScore: Int
    @Binding var oponentScore: Int
    @Binding var round: Int
    
    var body: some View{
        VStack{
            CustomTitleText(text: "Take your pick")
                .padding(.top,92)
                .padding(.bottom,12)
            ScoreText(text: "Score \(selfScore):\(oponentScore)")
                .padding(.bottom,74)
            VStack(spacing: 24) {
                RPSChoiceBtn(text: Choices.paper.rawValue,action: {selfChoice = setChoice(choice: .paper)})
                RPSChoiceBtn(text: Choices.scissors.rawValue,action: {selfChoice = setChoice(choice: .scissors)})
                RPSChoiceBtn(text: Choices.rock.rawValue,action: {selfChoice = setChoice(choice: .rock)})
            }
            Spacer()
        }
        .onChange(of: selfChoice) { newValue in
            screenState = .change
        }
        .navigationTitle("Round #\(round)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

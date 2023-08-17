//
//  MultiPlayerOponentChoiceView.swift
//  RPS
//
//  Created by Dinmukhambet Turysbay on 15.04.2023.
//

import SwiftUI

struct MultiPlayerOponentChoiceView: View{
    @Binding var screenState: ScreenState
    @Binding var selfScore: Int
    @Binding var oponentScore: Int
    @Binding var oponentChoice: Choices
    var body: some View{
        VStack{
            CustomTitleText(text: "Take your pick")
                .padding(.top,92)
                .padding(.bottom,12)
            ScoreText(text: "Score \(selfScore):\(oponentScore)")
                .padding(.bottom,74)
            VStack(spacing: 24) {
                RPSChoiceBtn(text: Choices.paper.rawValue,action: {oponentChoice = .paper})
                RPSChoiceBtn(text: Choices.scissors.rawValue,action: {oponentChoice = .scissors})
                RPSChoiceBtn(text: Choices.rock.rawValue,action: {oponentChoice = .rock})
            }
            .onChange(of: oponentChoice) { newValue in
                screenState = .showResult
            }
            Spacer()
        }
    }
}

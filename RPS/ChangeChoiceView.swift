//
//  ChangeChoiceView.swift
//  RPS
//
//  Created by Dinmukhambet Turysbay on 15.04.2023.
//

import SwiftUI

struct ChangeChoiceView: View{
    @Binding var choice: Choices
    @Binding var screenState: ScreenState
    @Binding var selfScore: Int
    @Binding var oponentScore: Int
    @ObservedObject private var focusBreakManager = FocusBreakManager(elapsedSeconds: 5)
    
    var body: some View{
        VStack{
            CustomTitleText(text: "Your pick")
                .padding(.top,92)
                .padding(.bottom,12)
            ScoreText(text: "Score \(selfScore):\(oponentScore)")
                .padding(.bottom,100)
            RPSChoiceBtn(text: choice.rawValue)
            Text("\(focusBreakManager.elapsedSeconds)")
            Spacer()
            CustomPurpleButton(text: "I changed my mind")
                .padding(.bottom,40)
                .onTapGesture {
                    screenState = .choose
                    choice = .none
                }
        }
        .onAppear {
            focusBreakManager.start()
        }
        .onChange(of: focusBreakManager.timerState){ newValue in
            if(newValue == .off && focusBreakManager.elapsedSeconds == 0){
                screenState = .openentChoose
            }
        }
    }
}

//
//  ShowOponentChoice.swift
//  RPS
//
//  Created by Dinmukhambet Turysbay on 15.04.2023.
//

import SwiftUI

struct ShowOponentChoice: View{
   
    @Binding var screenState: ScreenState
    @Binding var oponentChoice: Choices
    @ObservedObject private var focusBreakManager = FocusBreakManager(elapsedSeconds: 2)
    
    var body: some View{
        VStack{
            CustomTitleText(text: "Your oponent's pick")
                .padding(.top,10)
            Spacer()
            RPSChoiceBtn(text: oponentChoice.rawValue)
            Spacer()
        }
        .onAppear{
            focusBreakManager.start()
        }
        .onChange(of: focusBreakManager.timerState){ newValue in
            if(newValue == .off && focusBreakManager.elapsedSeconds == 0){
                screenState = .showResult
            }
        }
    }
}

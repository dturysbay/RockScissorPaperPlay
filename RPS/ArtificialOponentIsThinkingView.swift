//
//  ArtificialOponentIsThinkingView.swift
//  RPS
//
//  Created by Dinmukhambet Turysbay on 15.04.2023.
//

import SwiftUI

struct ArtificialOponentIsThinkingView: View {
    @Binding var isSinglePlayer: PlayerMode?
    @Binding var screenState: ScreenState
    @Binding var oponentChoice: Choices
    @ObservedObject private var focusBreakManager = FocusBreakManager(elapsedSeconds: 2)
    
var body: some View {
    VStack{
        Group{
                if let isSinglePlayer = isSinglePlayer, isSinglePlayer == .single{
                    VStack{
                         CustomTitleText(text: "Your oponent is thinking")
                             .padding(.top,10)
                         Spacer()
                         ZStack{
                             LightBlueBackground()
                             Image(systemName: "circle.dotted")
                                 .font(.system(size: 48))
                         }
                         Text("\(focusBreakManager.elapsedSeconds)")
                         Spacer()
                     }
                     .onAppear{
                         oponentChoice = getRandomValue()
                         focusBreakManager.start()
                     }
                     .onChange(of: focusBreakManager.timerState){ newValue in
                         if(newValue == .off && focusBreakManager.elapsedSeconds == 0){
                             screenState = .showOponentChoice
                         }
                     }
                }else{
                    VStack{
                         CustomTitleText(text: "Pass the phone to your opponent")
                             .padding(.top,10)
                         Spacer()
                        CustomPurpleButton(text: "Ready to continue")
                            .padding(.bottom,40)
                            .onTapGesture {
                                screenState = .multiPlayerOponentChoice
                            }
                     }
                }
            }
        }
    }
}

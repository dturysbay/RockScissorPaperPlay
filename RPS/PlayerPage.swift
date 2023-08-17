//
//  SinglePlayerPage.swift
//  RPS
//
//  Created by Dinmukhambet Turysbay on 13.04.2023.
//

import SwiftUI

struct PlayerPage: View {
    @Binding var isSinglePlayer: PlayerMode?
    @State var selfChoice: Choices = .none
    @State var oponentChoice: Choices = .none
    @State var screenState: ScreenState = .choose
    @State var selfScore: Int = 0
    @State var oponentScore: Int = 0
    @State var round: Int = 1
    

    var body: some View {
      switch screenState {
        case .choose:
            ChooseView(
                selfChoice: $selfChoice,
                screenState:$screenState,
                selfScore: $selfScore,
                oponentScore: $oponentScore,
                round: $round
            )
        case .change:
            ChangeChoiceView(
                choice: $selfChoice,
                screenState: $screenState,
                selfScore: $selfScore,
                oponentScore: $oponentScore
            )
        case .openentChoose:
            ArtificialOponentIsThinkingView(
                isSinglePlayer: $isSinglePlayer,
                screenState: $screenState,
                oponentChoice: $oponentChoice
            )
        case .showOponentChoice:
            ShowOponentChoice(
                screenState: $screenState,
                oponentChoice: $oponentChoice
            )
        case .showResult:
            ShowResult(
                screenState: $screenState,
                oponentChoice: $oponentChoice,
                selfChoice: $selfChoice,
                selfScore: $selfScore,
                oponentScore: $oponentScore,
                round: $round
            )
      case .multiPlayerOponentChoice:
          MultiPlayerOponentChoiceView(
            screenState: $screenState,
            selfScore: $selfScore,
            oponentScore: $oponentScore,
            oponentChoice: $oponentChoice
          )
        }
    }
}

struct SinglePlayerPage_Previews: PreviewProvider {
    static var previews: some View {
        PlayerPage(isSinglePlayer: .constant(.single))
    }
}

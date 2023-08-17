//
//  ShowResult.swift
//  RPS
//
//  Created by Dinmukhambet Turysbay on 15.04.2023.
//

import SwiftUI

struct ShowResult: View{
    @Binding var screenState: ScreenState
    @Binding var oponentChoice: Choices
    @Binding var selfChoice: Choices
    @Binding var selfScore: Int
    @Binding var oponentScore: Int
    @Binding var round: Int
    
    var body: some View{
        return VStack(alignment: .center){
            Group{
                if(selfChoice.beats(oponentChoice)){
                    WinGradientTitle()
                        .onAppear{
                            selfScore += 1
                        }
                }else if(oponentChoice.beats(selfChoice)){
                    LooseGradientTitle()
                        .onAppear{
                            oponentScore += 1
                        }
                }else{
                    TieGradientTitle()
                }
            }
            .padding(.top,70)
            
            ScoreText(text: "Score \(selfScore):\(oponentScore)")
                .padding(.bottom,80)
                

            RPSChoiceBtn(text: selfChoice.rawValue)
                .padding(.leading,24)
                .padding(.trailing,150)
            
            ZStack {
                Button(action:{}){
                    ZStack{
                        RoundedRectangle(cornerRadius: 48, style: .continuous)
                           .fill(Color(red:243/255, green:242/255, blue:248/255))
                           .frame(width:170,height: 128)
                        Text(oponentChoice.rawValue).font(.system(size: 48))
                    }
                }
            }
            .padding()
            .background(.white)
            .cornerRadius(60)
            .offset(x: 20, y:-70)
            Spacer()
            Button(action: {
                screenState = .choose
                round += 1
                selfChoice = .none
                oponentChoice = .none
            } , label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color(red:103/255, green:80/255, blue:164/255))
                        .frame(height: 50)
                        .padding(.horizontal,16)
                    Text("Another round")
                        .foregroundColor(.white)
                        .font(.system(size: 16,weight: .semibold))
                        .frame(height: 50)
                        .padding(.horizontal,16)
                }
            })
        }
    }
}

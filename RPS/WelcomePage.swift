//
//  WelcomePage.swift
//  RPS
//
//  Created by Dinmukhambet Turysbay on 13.04.2023.
//

import SwiftUI

struct WelcomePage: View {
//    @State var secondView = false
    @State var isSinglePlayer: PlayerMode? = nil
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("WelcomePageBG")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack{
                    CustomTitleText(text: "Welcome to the game!",color: .white)
                        .padding(.top,92)
//                        .padding(.bottom,450)
                    Spacer()
                    NavigationLink(destination: PlayerPage(isSinglePlayer: $isSinglePlayer),tag:PlayerMode.single,selection: $isSinglePlayer){
                        CustomPurpleButton(text: "Single Player")
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    
                    NavigationLink(destination: PlayerPage(isSinglePlayer: $isSinglePlayer),tag: PlayerMode.multi,selection: $isSinglePlayer){
                        CustomPurpleButton(text: "Multiple Player")
                            .padding(.bottom,50)
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    Spacer()
                }
            }
        }
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}

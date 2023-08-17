//
//  Components.swift
//  RPS
//
//  Created by Dinmukhambet Turysbay on 13.04.2023.
//

import SwiftUI

enum PlayerMode: String{
    case single = "single"
    case multi = "multi"
}

func setChoice(choice: Choices) -> Choices{
    return choice
}

struct CustomButton: View{
    let text: String
    let action: () -> ()
    var body: some View{
        Button(action: action) {
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color(red:103/255, green:80/255, blue:164/255))
                               .frame(height: 50)
                               .padding(.horizontal,16)
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 16,weight: .semibold))
            }
        }
        .padding(.horizontal,10)
    }
}

struct CustomPurpleButton: View{
    let text: String
    init(text: String) {
        self.text = text
    }
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color(red:103/255, green:80/255, blue:164/255))
                .frame(height: 50)
                .padding(.horizontal,16)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 16,weight: .semibold))
                .frame(height: 50)
                .padding(.horizontal,16)
        }
    }
}

struct CustomTitleText: View{
    let text: String
    let color: Color
    init(text: String, color: Color = .black) {
        self.text = text
        self.color = color
    }
    var body: some View{
        Text(text)
            .foregroundColor(color)
            .font(.system(size: 54, weight: .bold))
            .multilineTextAlignment(.center)
    }
}

struct ScoreText: View{
    let text: String
    var body: some View{
        Text(text)
            .foregroundColor(Color(red:103/255, green:80/255, blue:164/255))
            .font(.system(size: 17,weight: .semibold))
    }
}

struct RPSChoiceBtn: View{
    let text: String
    let action: () -> ()
    init(text: String, action: @escaping () -> Void = {}) {
        self.text = text
        self.action = action
    }
    var body: some View{
        Button(action: action)
        {
            ZStack{
                LightBlueBackground()
                Text(text).font(.system(size: 48))
            }
        }
    }
}

struct LightBlueBackground: View{
    var body: some View{
        RoundedRectangle(cornerRadius: 48, style: .continuous)
            .fill(Color(red:243/255, green:242/255, blue:248/255))
            .frame(height: 128)
            .padding(.horizontal,24)
    }
}

struct WinGradientTitle: View{
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [Color(red: 181/255, green: 238/255, blue: 155/255),Color(red: 26/255, green: 174/255, blue: 67/255)]), startPoint: .leading, endPoint: .trailing)
            .mask(
                CustomTitleText(text: "Win!")
            )
            .frame(height: 62)
    }
}

struct TieGradientTitle: View{
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 204/255, blue: 0/255),Color(red: 255/255, green: 92/255, blue:0/255)]), startPoint: .leading, endPoint: .trailing)
            .mask(
                CustomTitleText(text: "Tie!")
            )
            .frame(height: 62)
    }
}

struct LooseGradientTitle: View{
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 105/255, blue: 97/255),Color(red: 253/255, green: 77/255, blue:77/255)]), startPoint: .leading, endPoint: .trailing)
            .mask(
                CustomTitleText(text: "Loose")
            )
            .frame(height: 62)
    }
}


//struct TimerView: View {
//
//    @ObservedObject private var focusBreakManager = FocusBreakManager()
//
//    var body: some View {
//        VStack {
//            Text("\(focusBreakManager.elapsedSeconds)")
//            Text(focusBreakManager.timerRunningMessage)
//        }
//        .onAppear(perform: focusBreakManager.start)
//        .padding()
//    }
//}

class FocusBreakManager: ObservableObject {

    enum TimerState: String{
        case on = "on"
        case off = "off"
        case paused = "paused"
    }

    var timer: Timer = Timer()
    @Published var elapsedSeconds = Int()

    init(elapsedSeconds: Int) {
        self.elapsedSeconds = elapsedSeconds
    }
//    var timerRunningMessage: String {
//        timerRunning
//        ? TimerState.on.rawValue
//        : TimerState.off.rawValue
//    }
    
    var timerState: TimerState{
        timerRunning ? .on : .off
    }

    private var timerRunning: Bool {
        timer.isValid
    }

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.elapsedSeconds -= 1
            if self.elapsedSeconds <= 0 {
                self.timer.invalidate()
            }
        }
    }

}

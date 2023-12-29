//
//  LongTimerView.swift
//  TaskTailTowers
//
//  Created by Hanabel Mengistu on 12/29/23.
//

import SwiftUI

struct LongTimerView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var tapped = false
    var body: some View {
        ZStack{
            Color(UIColor(hex: "#F7E3D9")).ignoresSafeArea(.all)
            VStack{
                Spacer()
                
                Text(viewModel.secondsToMinutesAndSeconds(viewModel.longBreakTimeRemaining))
                    .font(.custom("ComingSoon-Regular", size:90))
                    .foregroundColor(.black)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 50) {
                    if viewModel.longBreakTimerMode == .running || viewModel.longBreakTimerMode == .paused{
                        Button(action: {
                            viewModel.resetTimers()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .bold()
                                .font(.system(size:20))
                        }
                    }
                    
                    Button(action: {
                        if viewModel.longBreakTimerMode == .running{
                            viewModel.pauseTimers()
                            tapped.toggle()
                        } else{
                            viewModel.startLongBreakTimer()
                            tapped.toggle()
                        }
                    }){
                        ZStack{
                            Circle()
                                .frame(width:70, height:70)
                                .foregroundColor(Color(UIColor(hex:"5c452d")))  //HERE'S THE COLOR THAT I WILL CHANGE
                            Image(systemName: viewModel.longBreakTimerMode == .running ? "pause.fill" : "play.fill")
                                .foregroundColor(.black)
                                .font(.system(size:34))
                        }
                    }
                    if viewModel.longBreakTimerMode == .running || viewModel.longBreakTimerMode == .paused {
                        Button(action:{
                            viewModel.advanceOneMinuteForward()
                        }) {
                            Image(systemName: "goforward")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .rotationEffect(.degrees(60))
                                .font(.system(size:20))
                        }
                    }
                }
                .padding(.bottom, 50)
            }
        }
    }
    
}

#Preview {
    LongTimerView()
}

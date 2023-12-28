//
//  ProgressRing.swift
//  TaskTailTowers
//
//  Created by Hanabel Mengistu on 12/28/23.
//


import SwiftUI

struct ProgressRing: View {
    @EnvironmentObject var timerManager : TimerManager
    
    let timerObject = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            // MARK: placeholder ring
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            
            // MARK: colored ring (filler)
            Circle()
                .trim(from: 0.0, to: min(timerManager.progress, 1.0))
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [.blue, .cyan, .indigo, .purple, .pink, .red, .indigo, .blue]), center: .center),
                    style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect((Angle(degrees: 270)))
                .animation(.easeInOut(duration: 1.0), value: timerManager.progress)
            
            VStack(spacing: 24) {
                // MARK: elapsed time
                VStack(spacing: 8) {
                    Text("Elapsed time (\(timerManager.progress.formatted(.percent)))")
                        .opacity(0.8)
                    if timerManager.timerState == .notStarted {
                        Text("00:00")
                            .font(.title)
                            .fontWeight(.bold)
                    } else {
                        Text(timerManager.startTime, style: .timer)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 20)
                // MARK: remaining time

            }
        }
        .frame(width: 250, height: 250)
        .padding()
        // receive a notification about the 2nd timer
        .onReceive(timerObject) { _ in
            timerManager.track()
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
            .environmentObject(TimerManager())
    }
}

//
//  PomodoroContentView.swift
//  TaskTailTowers
//
//  Created by Hanabel Mengistu on 12/29/23.
//

import SwiftUI

struct PomodoroContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var selectedTab = 0
    @State private var indicatorOffset: CGFloat = -3.5
    
    init(){
        _selectedTab = State(initialValue: 0)
        _indicatorOffset = State(initialValue: 0)
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(UIColor(hex: "#F7E3D9" )).edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Spacer()
                        Text("Pomodoro")
                            .font(.custom("ComingSoon-Regular", size:18))
                            .foregroundColor(selectedTab == 0 ? .black : .gray)
                            .onTapGesture{
                                selectedTab = 0
                                indicatorOffset = UIScreen.main.bounds.width / 3.5
                            }
                        Spacer()
                        Text("Short Break")
                            .font(.custom("ComingSoon-Regular", size:18))
                            .foregroundColor(selectedTab == 1 ? .black : .gray)
                            .onTapGesture{
                                selectedTab = 1
                                indicatorOffset = 1
                            }
                        Spacer()
                        Text("Long Break")
                            .font(.custom("ComingSoon-Regular", size:18))
                            .foregroundColor(selectedTab == 2 ? .black : .gray)
                            .onTapGesture{
                                selectedTab = 2
                                indicatorOffset = UIScreen.main.bounds.width / 3.5
                            }
                        Spacer()
                    }
                    .font(.title3)
                    .bold()
                    .padding()
                    
                    Rectangle()
                        .fill(Color(UIColor(hex:"5c452d")))
                        .frame(width: UIScreen.main.bounds.width / 0, height: 2)
                        .offset(x: indicatorOffset, y: 0)
                    
                    TabView(selection: $selectedTab){
                        TimerView(viewModel: viewModel)
                            .tag(0)
                        ShortTimerView(viewModel: viewModel)
                            .tag(1)
                        LongTimerView(viewModel: viewModel)
                            .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    PomodoroContentView()
}

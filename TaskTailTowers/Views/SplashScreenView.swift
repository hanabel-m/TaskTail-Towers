//
//  SplashScreenView.swift
//  TaskTailTowers
//
//  Created by Hanabel Mengistu on 12/27/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            ContentView()
        }
        else{
            VStack{
                VStack(alignment:.center){
                    if let uiImage = UIImage(named: "TaskCatfront.png") {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 400)
                            .padding(.bottom, 1)
                    }
                    Text("Tasktail Towers")
                        .font(.custom("ComingSoon-Regular", size:30))
                        .foregroundColor(.black.opacity(0.80))
                }
                
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 5)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }

            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor(hex: "#F7E3D9")))
            .edgesIgnoringSafeArea(.all)
        }

    }
}


extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


#Preview {
    SplashScreenView()
}

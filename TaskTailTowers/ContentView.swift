import SwiftUI

struct ContentView: View {
    @State private var index = 0

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                ZStack {
                    destinationView(for: index)
                }
                .padding(.bottom, 12)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                Spacer()

                CustomTabs(index: $index)
                    .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor(hex: "#F7E3D9")))
            .edgesIgnoringSafeArea(.all)
        }
    }

    @ViewBuilder
    func destinationView(for index: Int) -> some View {
        switch index {
        case 0:
            TimerView()
        case 1:
            ToDoListView()
        case 2:
            HomeView()
        case 3:
            ShopView()
        case 4:
            SettingsView()
        default:
            EmptyView()
        }
    }
}

struct CustomTabs: View {
    @Binding var index: Int

    var body: some View {
        HStack {
            ForEach(0 ..< 5) { i in
                Button(action: {
                    self.index = i
                }) {
                    Image("\(tabImageName(for: i))")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                }
                .foregroundColor(Color.black.opacity(self.index == i ? 1 : 0.3))
                .padding(.horizontal, 15)
            }
        }
        .padding(EdgeInsets(top: 20, leading: 16, bottom: 8, trailing: 16)) // Adjust the padding as needed
        .background(Color(UIColor(hex: "f9eee8")))
        
    }

    func tabImageName(for index: Int) -> String {
        switch index {
        case 0:
            return "ClockTTT"
        case 1:
            return "TasksTTT"
        case 2:
            return "HomeTTT"
        case 3:
            return "ShopTTT"
        case 4:
            return "SettingsTTT"
        default:
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

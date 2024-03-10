import SwiftUI

struct SettingsView: View {
    @Environment(\.openWindow) private var openWindow
    @EnvironmentObject var view: WindowView
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    view.mainView()
                }) {
                    Image(systemName: "arrow.left")
                }
                Text("Settings").font(.title)
                Spacer()
            }
            ScrollView {
                VStack {
                    Toggle("Battery", isOn: $view.showBatteryInfo)
                    Toggle("24 Hour", isOn: $view.enable24H)
                    Toggle("Second", isOn: $view.showSecond)
                    Toggle("Background", isOn: $view.hasGlassBackground)
                    Button(action:{ openWindow(value: WindowView().id) }) {
                        Label("New Window", systemImage: "plus.square.on.square")
                    }
                    .buttonBorderShape(.roundedRectangle(radius: 4))
                    .padding()
                    Spacer()
                }
                .padding()
                .frame(maxWidth: 300)
            }
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}


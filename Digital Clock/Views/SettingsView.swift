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
                    Button("New Window") {
                        openWindow(value: WindowView().id)
                    }
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


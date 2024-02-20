import SwiftUI

struct SettingsView: View {
    @Environment(\.openWindow) private var openWindow
    @EnvironmentObject var view: WindowView
    
    var body: some View {
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
            .padding([.horizontal])
            .frame(maxWidth: 300)
        }
        .navigationTitle("Settings")
        .onAppear {
            view.setSettingsView()
        }
    }
}

#Preview {
    SettingsView()
}


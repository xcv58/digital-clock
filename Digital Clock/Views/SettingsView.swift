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
        }
        .navigationTitle("Settings")
        .padding([.leading, .trailing])
        .frame(maxWidth: 300)
        .onAppear {
            view.setSettingsView()
        }
    }
}

#Preview {
    SettingsView()
}


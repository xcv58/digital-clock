import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Toggle("24 Hour", isOn: $settingsViewModel.enable24H)
                    Toggle("Show Second", isOn: $settingsViewModel.showSecond)
                    Toggle("Show Battery Info", isOn: $settingsViewModel.showBatteryInfo)
                    Button("Back") {
                        settingsViewModel.isSettingsOpen = false
                    }
                }
                .padding()
                .frame(maxWidth: 400)
            }
        }
    }
}

#Preview {
    SettingsView()
}


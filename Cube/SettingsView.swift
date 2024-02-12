import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Toggle("24 Hour", isOn: $settingsViewModel.enable24H)
                    Toggle("Show Battery Info", isOn: $settingsViewModel.showBatteryInfo)
                    Button("Back") {
                        settingsViewModel.isSettingsOpen = false
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    SettingsView()
}


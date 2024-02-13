import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        HStack {
            VStack {
                Toggle("24 Hour", isOn: $settingsViewModel.enable24H)
                Toggle("Second", isOn: $settingsViewModel.showSecond)
                Toggle("Battery", isOn: $settingsViewModel.showBatteryInfo)
                Spacer()
            }
            .padding()
            .frame(maxWidth: 400)
        }
    }
}

#Preview {
    SettingsView()
}


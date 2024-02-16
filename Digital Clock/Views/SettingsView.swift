import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        VStack {
            Toggle("Battery", isOn: $settingsViewModel.showBatteryInfo)
            Toggle("24 Hour", isOn: $settingsViewModel.enable24H)
            Toggle("Second", isOn: $settingsViewModel.showSecond)
            Spacer()
        }
        .offset(y: -40)
        .padding()
        .frame(maxWidth: 300)
    }
}

#Preview {
    SettingsView()
}


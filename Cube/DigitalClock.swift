import SwiftUI

struct DigitalClock: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        ZStack {
            if settingsViewModel.isSettingsOpen {
                SettingsView().transition(.opacity)
            } else {
                if (settingsViewModel.showBatteryInfo) {
                    BatteryInfoView()
                }
                ClockView()
            }
        }.transition(.opacity)
    }

}

#Preview {
    DigitalClock()
}

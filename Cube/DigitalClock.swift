import SwiftUI

struct DigitalClock: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        ZStack {
            if (settingsViewModel.showBatteryInfo) {
                BatteryInfoView()
            }
            NavigationLink (destination: SettingsView()) {
                ClockView()
            }
        }
    }
}

#Preview {
    DigitalClock()
}

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
            .buttonBorderShape(.roundedRectangle)
            .statusBarHidden()
            .buttonStyle(.plain)
        }
        .frame(width: 400, height: 200)
    }
}

#Preview {
    DigitalClock()
}

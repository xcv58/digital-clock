import SwiftUI

struct DigitalClock: View {
    @EnvironmentObject var view: WindowView
    
    var body: some View {
        ZStack {
            if (view.showBatteryInfo) {
                BatteryInfoView()
            }
            Button(action: view.settingsView) {
                ClockView()
            }
            .buttonBorderShape(.roundedRectangle(radius: 4))
            .buttonStyle(.plain)
            .padding()
        }
        .persistentSystemOverlays(.hidden)
    }
}

#Preview {
    DigitalClock()
}

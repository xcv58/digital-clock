import SwiftUI

struct DigitalClock: View {
    @EnvironmentObject var view: WindowView
    
    var body: some View {
        ZStack {
            if (view.showBatteryInfo) {
                BatteryInfoView()
            }
            NavigationLink (destination: SettingsView()) {
                ClockView()
            }
            .buttonBorderShape(.roundedRectangle)
            .statusBarHidden()
            .buttonStyle(.plain)
            .padding()
        }
        .onAppear {
            view.setMainView()
        }
    }
}

#Preview {
    DigitalClock()
}

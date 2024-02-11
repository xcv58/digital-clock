import SwiftUI

struct DigitalClock: View {
    var body: some View {
        ZStack {
            BatteryInfoView()
            ClockView()
        }
    }
}

#Preview {
    DigitalClock()
}

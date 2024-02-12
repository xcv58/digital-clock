import SwiftUI
import RealityKit
import RealityKitContent

struct ClockView: View {

    @State private var currentTime: String = ""
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @Environment(\.openWindow) private var openWindow

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    func updateCurrentTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium // This uses the HH:mm:ss format
        formatter.locale = Locale.current // Use the current locale or specify a particular locale
        if (settingsViewModel.enable24H) {
          formatter.dateFormat = "HH:mm:ss" // Explicitly set to use 24-hour time format
        }
        currentTime = formatter.string(from: Date())
    }
    
    var body: some View {
            VStack {
                    Text(currentTime)
                        .font(.extraLargeTitle)
                        .bold()
                        .onAppear(perform: updateCurrentTime)
                        .onReceive(timer) { _ in
                            self.updateCurrentTime()
                        }
            }
            .padding()
            .onTapGesture {
                settingsViewModel.isSettingsOpen = true
            }
            .aspectRatio(contentMode: .fit)
    }
}

#Preview(windowStyle: .automatic) {
    ClockView()
}

import SwiftUI

@main
struct MainApp: App {
    var settingsViewModel = SettingsViewModel()

    var body: some Scene {
        WindowGroup (id: "main") {
            NavigationStack {
                DigitalClock()
            }
            .environmentObject(settingsViewModel)
            .frame(width: 400, height: 200)
        }
        .windowStyle(.automatic)
        .windowResizability(.contentSize)
    }
}

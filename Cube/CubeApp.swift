import SwiftUI

@main
struct CubeApp: App {
    var settingsViewModel = SettingsViewModel()

    var body: some Scene {
        WindowGroup (id: "main") {
            NavigationStack {
                DigitalClock()
            }
            .environmentObject(settingsViewModel)
        }
        .windowStyle(.automatic)
        .defaultSize(CGSize(width: 400, height: 200))
        .windowResizability(.contentSize)
    }
}

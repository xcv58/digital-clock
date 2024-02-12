import SwiftUI

@main
struct CubeApp: App {
    var settingsViewModel = SettingsViewModel()

    var body: some Scene {
        WindowGroup (id: "main") {
            DigitalClock()
                .environmentObject(settingsViewModel)
                .animation(.default, value: settingsViewModel.isSettingsOpen)
        }
        .windowStyle(.automatic)
        .defaultSize(CGSize(width: 400, height: 200))
        .windowResizability(.contentMinSize)
    }
}

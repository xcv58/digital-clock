import SwiftUI

@main
struct CubeApp: App {
    var body: some Scene {
        WindowGroup (id: "test") {
            BatteryInfoView()
//            ContentView()
        }
        .windowStyle(.automatic)
        .defaultSize(CGSize(width: 400, height: 200))
        .windowResizability(.contentSize)
    }
}


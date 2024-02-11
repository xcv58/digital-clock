import SwiftUI

@main
struct CubeApp: App {
    var body: some Scene {
        WindowGroup (id: "test") {
            ContentView()
        }
        .windowStyle(.automatic)
        .defaultSize(CGSize(width: 360, height: 180))
        .windowResizability(.contentSize)
    }
}


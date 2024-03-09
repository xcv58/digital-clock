import SwiftUI

@main
struct MainApp: App {
    
    var body: some Scene {
        let defaultWindowView = WindowView(id: "")
        WindowGroup(id: "main") {
            ContentView().environmentObject(defaultWindowView)
        }
        .windowStyle(.plain)
        .windowResizability(.contentSize)
        
        WindowGroup(for: WindowView.ID.self) {$windowID in
            let windowView = WindowView(id: windowID!)
            ContentView().environmentObject(windowView)
        }
        .windowStyle(.plain)
        .windowResizability(.contentSize)
    }
}

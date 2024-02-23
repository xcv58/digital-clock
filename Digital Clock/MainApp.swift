import SwiftUI

@main
struct MainApp: App {
    
    var body: some Scene {
        WindowGroup(id: "main") {
            ContentView().environmentObject(WindowView(id: ""))
                .persistentSystemOverlays(.hidden)
        }
        .windowStyle(.automatic)
        .windowResizability(.contentSize)
        
        WindowGroup(for: WindowView.ID.self) {$windowID in
            ContentView().environmentObject(WindowView(id: windowID!))
                .persistentSystemOverlays(.hidden)
        }
        .windowStyle(.automatic)
        .windowResizability(.contentSize)
    }
}

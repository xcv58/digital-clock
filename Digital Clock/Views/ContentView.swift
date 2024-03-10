import SwiftUI

struct ContentView: View {
    @EnvironmentObject var view: WindowView
    
    var body: some View {
        if view.showSettings {
            SettingsView()
                .frame(width: view.width, height: view.height)
                .background()
                .backgroundStyle(.clear)
                .glassBackgroundEffect()
        } else {
            DigitalClock()
                .frame(width: view.width, height: view.height)
        }
    }
}

#Preview {
    ContentView()
}

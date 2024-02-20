import SwiftUI

struct ContentView: View {
    @EnvironmentObject var view: WindowView

    var body: some View {
        NavigationStack {
            DigitalClock()
        }
        .frame(width: view.width, height: view.height)
    }
}

#Preview {
    ContentView()
}

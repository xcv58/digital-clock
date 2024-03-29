import SwiftUI
import RealityKit

struct ClockView: View {

    @State private var currentTime: String = ""
    @EnvironmentObject var view: WindowView
    @Environment(\.openWindow) private var openWindow

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    func updateCurrentTime() {
        let formatter = DateFormatter()
        formatter.locale = Locale.current // Use the current locale or specify a particular locale
        if (view.enable24H) {
            formatter.dateFormat = view.showSecond ? "HH:mm:ss" : "HH:mm"
        } else {
            formatter.timeStyle = view.showSecond ? .medium : .short // This uses the HH:mm:ss format
        }
        currentTime = formatter.string(from: Date())
    }
    
    var body: some View {
        Text(currentTime)
            .font(.extraLargeTitle)
            .bold()
            .onAppear(perform: updateCurrentTime)
            .onReceive(timer) { _ in
                self.updateCurrentTime()
            }
            .padding()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview(windowStyle: .automatic) {
    ClockView()
}

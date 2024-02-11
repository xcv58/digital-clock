import SwiftUI
import RealityKit
import RealityKitContent

struct ClockView: View {

    @State private var currentTime: String = ""
    @Environment(\.openWindow) private var openWindow

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    func updateCurrentTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium // This uses the HH:mm:ss format
        formatter.locale = Locale.current // Use the current locale or specify a particular locale
        formatter.dateFormat = "HH:mm:ss" // Explicitly set to use 24-hour time format
        currentTime = formatter.string(from: Date())
    }
    
    var body: some View {
        VStack {
                Text(currentTime)
                    .bold()
                    .font(.largeTitle)
//                    .font(.system(size: geometry.size.width * 0.17)) // Adjust the multiplier as needed
//                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .onAppear(perform: updateCurrentTime)
                    .onReceive(timer) { _ in
                        self.updateCurrentTime()
                    }
//            GeometryReader { geometry in
//                Text(currentTime)
//                    .bold()
////                    .font(.largeTitle)
////                    .font(.system(size: geometry.size.width * 0.17)) // Adjust the multiplier as needed
////                    .frame(width: geometry.size.width, height: geometry.size.height)
//                    .onAppear(perform: updateCurrentTime)
//                    .onReceive(timer) { _ in
//                        self.updateCurrentTime()
//                    }
//            }
        }
        .padding()
        .onTapGesture {
            openWindow(id: "test")
        }
        .aspectRatio(contentMode: .fill)
    }
}

#Preview(windowStyle: .automatic) {
    ClockView()
}

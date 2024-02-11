import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var currentTime: String = ""
    @Environment(\.openWindow) private var openWindow

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    func updateCurrentTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium // This uses the HH:mm:ss format
        currentTime = formatter.string(from: Date())
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Text(currentTime)
                    .bold()
                    .font(.system(size: geometry.size.width * 0.17)) // Adjust the multiplier as needed
                    .padding(.top)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .onAppear(perform: updateCurrentTime)
                    .onReceive(timer) { _ in
                        self.updateCurrentTime()
                    }
            }
        }
        .padding()
        .onTapGesture {
            openWindow(id: "test")
        }
        .aspectRatio(contentMode: .fill)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

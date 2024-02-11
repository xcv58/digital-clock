//
//  ContentView.swift
//  Cube
//
//  Created by Yihong Chen on 2/3/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

//    @State private var showImmersiveSpace = false
//    @State private var immersiveSpaceIsShown = false
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
//            Model3D(named: "Scene", bundle: realityKitContentBundle)
//                .padding(.bottom, 50)

            Text(currentTime)
                .font(.largeTitle)
                .onAppear(perform: updateCurrentTime)
                .onReceive(timer) { _ in
                    self.updateCurrentTime()
                }

//            Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
//                .toggleStyle(.button)
//                .padding(.top, 50)
        }
        .padding()
        .onTapGesture {
            openWindow(id: "test")
        }

//        .onChange(of: showImmersiveSpace) { _, newValue in
//            Task {
//                if newValue {
//                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
//                    case .opened:
//                        immersiveSpaceIsShown = true
//                    case .error, .userCancelled:
//                        fallthrough
//                    @unknown default:
//                        immersiveSpaceIsShown = false
//                        showImmersiveSpace = false
//                    }
//                } else if immersiveSpaceIsShown {
//                    await dismissImmersiveSpace()
//                    immersiveSpaceIsShown = false
//                }
//            }
//        }
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

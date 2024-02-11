//
//  CubeApp.swift
//  Cube
//
//  Created by Yihong Chen on 2/3/24.
//

import SwiftUI

@main
struct CubeApp: App {
    var body: some Scene {
        WindowGroup (id: "test") {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.progressive), in: .progressive)
    }
}

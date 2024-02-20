import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var width: CGFloat = 400
    @Published var height: CGFloat = 200
    
    public func setMainView() {
        self.setDimensions(width: 400, height: 200)
    }
    
    public func setSettingsView() {
        self.setDimensions(width: 400, height: 400)
    }

    private func setDimensions(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
}

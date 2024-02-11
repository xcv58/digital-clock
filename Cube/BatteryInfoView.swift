import SwiftUI
import UIKit

struct BatteryInfoView: View {
    @State private var batteryLevel: Float = UIDevice.current.batteryLevel
    @State private var batteryState: UIDevice.BatteryState = UIDevice.current.batteryState

    var body: some View {
        HStack{
            Spacer()
            VStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.gray)
                        .frame(width: 70, height: 30) // Adjust for horizontal orientation
                        .overlay(
                            HStack(spacing: 0) {
                                // Battery level
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(batteryLevelColor)
                                    .frame(width: CGFloat(max(0, batteryLevel)) * 68, height: 28) // Adjust width for battery level
                                Spacer(minLength: 0) // Keeps the filled part to the left
                            }
                        )
                    
                    // Battery nipple
                    RoundedRectangle(cornerRadius: 1)
                        .frame(width: 5, height: 14) // Size of the nipple
                        .offset(x: 36, y: 0) // Adjust based on the main body's size
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 2) {
                        Text("\(Int(batteryLevel * 100))%")
                            .font(.caption)
                            .foregroundColor(textColorForBatteryLevel(batteryLevel))
                            .shadow(color: shadowColorForBatteryLevel(batteryLevel), radius: 1, x: 0, y: 0)
                        
                        if batteryState == .charging {
                            Image(systemName: "bolt.fill")
                                .foregroundColor(.accentColor)
                                .shadow(color: shadowColorForBatteryLevel(batteryLevel), radius: 1, x: 0, y: 0)
                        }
                    }
                    .offset(y: 0) // Adjust the vertical position as needed
                }
                Spacer()
            }
            .offset(x: -8)
            .padding()
        }
        .onAppear {
            UIDevice.current.isBatteryMonitoringEnabled = true
            updateBatteryInfo()
            
            NotificationCenter.default.addObserver(forName: UIDevice.batteryLevelDidChangeNotification, object: nil, queue: .main) { _ in
                self.updateBatteryInfo()
            }
            
            NotificationCenter.default.addObserver(forName: UIDevice.batteryStateDidChangeNotification, object: nil, queue: .main) { _ in
                self.updateBatteryInfo()
            }
        }
    }
    
    private func updateBatteryInfo() {
        batteryLevel = UIDevice.current.batteryLevel
        batteryState = UIDevice.current.batteryState
    }
    
    private func shadowColorForBatteryLevel(_ level: Float) -> Color {
        // This is a simplistic approach. You might need to adjust it based on your app's theme or colors.
        if level > 0.5 {
            return .white // Use black text for lighter backgrounds.
        } else {
            return .black // Use white text for darker backgrounds.
        }
    }
    
    private func textColorForBatteryLevel(_ level: Float) -> Color {
        // This is a simplistic approach. You might need to adjust it based on your app's theme or colors.
        if level > 0.5 {
            return .black // Use black text for lighter backgrounds.
        } else {
            return .white // Use white text for darker backgrounds.
        }
    }
    
    
    private var batteryLevelColor: Color {
        switch batteryLevel {
        case 0...0.2: return .red
        case 0.21...0.5: return .yellow
        case 0.51...1.0: return .green
        default: return .gray
        }
    }
}

#Preview {
    BatteryInfoView()
}

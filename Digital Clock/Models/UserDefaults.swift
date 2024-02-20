import Foundation

extension UserDefaults {
    
    // Save a value for a specific window
    func set<T>(_ value: T, forKey key: String, windowID: String) {
        let windowSpecificKey = keyForWindow(windowID, key: key)
        UserDefaults.standard.set(value, forKey: windowSpecificKey)
    }
    
    func saveWindowIDs(_ ids: [String]) {
        UserDefaults.standard.set(ids, forKey: "windowIDs")
    }
    
    func loadWindowIDs() -> [String] {
        UserDefaults.standard.object(forKey: "windowIDs") as? [String] ?? []
    }
    
    struct Keys {
        static let enable24H = "enable24H"
        static let showBatteryInfo = "showBatteryInfo"
        static let showSecond = "showSeconds"
        static let timeZone = "timeZone"
    }
}

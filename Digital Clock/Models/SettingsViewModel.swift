import Foundation

extension UserDefaults {
    struct Keys {
        static let enable24H = "enable24H"
        static let showBatteryInfo = "showBatteryInfo"
        static let showSecond = "showSeconds"
        static let timeZone = "timeZone"
    }
}

func value<T>(forKey key: String, defaultValue: T) -> T {
    if let value = UserDefaults.standard.object(forKey: key) as? T {
        return value
    } else {
        return defaultValue
    }
}

class SettingsViewModel: ObservableObject {
    @Published var enable24H: Bool {
        didSet {
            UserDefaults.standard.set(enable24H, forKey: UserDefaults.Keys.enable24H)
        }
    }
    
    @Published var showBatteryInfo: Bool {
        didSet {
            UserDefaults.standard.set(showBatteryInfo, forKey: UserDefaults.Keys.showBatteryInfo)
        }
    }
    
    @Published var showSecond: Bool {
        didSet {
            UserDefaults.standard.set(showSecond, forKey: UserDefaults.Keys.showSecond)
        }
    }
    
    @Published var timeZone: String {
        didSet {
            UserDefaults.standard.set(timeZone, forKey: UserDefaults.Keys.timeZone)
        }
    }

    
    init() {
        self.enable24H = value(forKey: UserDefaults.Keys.enable24H, defaultValue: true)
        self.showBatteryInfo = value(forKey: UserDefaults.Keys.showBatteryInfo, defaultValue: true)
        self.showSecond = value(forKey: UserDefaults.Keys.showSecond, defaultValue: true)
        self.timeZone = value(forKey: UserDefaults.Keys.timeZone, defaultValue: "UTC")
    }
}

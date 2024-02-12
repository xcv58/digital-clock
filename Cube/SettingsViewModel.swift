import Foundation

extension UserDefaults {
    struct Keys {
        static let enable24H = "enable24H"
        static let showBatteryInfo = "showBatteryInfo"
        static let showSecond = "showSeconds"
        static let timeZone = "timeZone"
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
    
    @Published var isSettingsOpen: Bool = false
    
    init() {
        // Initialize from UserDefaults, providing default values if not found
        self.enable24H = UserDefaults.standard.bool(forKey: UserDefaults.Keys.enable24H)
        self.showBatteryInfo = UserDefaults.standard.bool(forKey: UserDefaults.Keys.showBatteryInfo)
        self.showSecond = UserDefaults.standard.bool(forKey: UserDefaults.Keys.showSecond)
        self.timeZone = UserDefaults.standard.string(forKey: UserDefaults.Keys.timeZone) ?? "UTC" // Default to UTC if not set
    }
}


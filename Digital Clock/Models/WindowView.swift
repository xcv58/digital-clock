import Foundation
import CoreGraphics // For CGSize and CGPoint

// Generates a key for a specific window's setting
func keyForWindow(_ windowID: String, key: String) -> String {
    if windowID.isEmpty {
        key
    } else {
        "\(windowID)_\(key)"
    }
}

// Retrieve a value for a specific window
func value<T>(forKey key: String, windowID: String, defaultValue: T) -> T {
    let windowSpecificKey = keyForWindow(windowID, key: key)
    if let value = UserDefaults.standard.object(forKey: windowSpecificKey) as? T {
        return value
    } else {
        return defaultValue
    }
}

func loadWindowIDs() -> [String] {
    UserDefaults.standard.object(forKey: "windowIDs") as? [String] ?? []
}

func saveWindowIDs(_ ids: [String]) {
    UserDefaults.standard.set(ids, forKey: "windowIDs")
}

class WindowView: Identifiable, Codable, Hashable, ObservableObject {
    var id: String
    @Published var width: CGFloat = 400
    @Published var height: CGFloat = 200
    @Published var showClock = true
    
    public func setMainView() {
        self.setDimensions(width: 400, height: 200)
        self.showClock = true
    }
    
    public func setSettingsView() {
        self.setDimensions(width: 400, height: 300)
        self.showClock = false
    }
    
    private func setDimensions(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    init(id: String = UUID().uuidString) {
        self.id = id
        self.enable24H = value(forKey: UserDefaults.Keys.enable24H, windowID: self.id, defaultValue: true)
        self.showBatteryInfo = value(forKey: UserDefaults.Keys.showBatteryInfo, windowID: self.id, defaultValue: true)
        self.showSecond = value(forKey: UserDefaults.Keys.showSecond, windowID: self.id, defaultValue: true)
        self.timeZone = value(forKey: UserDefaults.Keys.timeZone, windowID: self.id, defaultValue: "UTC")
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case enable24H
        case showBatteryInfo
        case showSecond
        case timeZone
    }
    
    
    // Custom init from Decoder
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        enable24H = try container.decode(Bool.self, forKey: .enable24H)
        showBatteryInfo = try container.decode(Bool.self, forKey: .showBatteryInfo)
        showSecond = try container.decode(Bool.self, forKey: .showSecond)
        timeZone = try container.decode(String.self, forKey: .timeZone)
        
        // Initialize @Published properties with default values
        // These values can be adjusted after initialization if needed
        _width = Published(initialValue: 400)
        _height = Published(initialValue: 200)
    }
    
    // Custom encode to Encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(enable24H, forKey: .enable24H)
        try container.encode(showBatteryInfo, forKey: .showBatteryInfo)
        try container.encode(showSecond, forKey: .showSecond)
        try container.encode(timeZone, forKey: .timeZone)
        // Note: @Published properties are not encoded here
    }
    
    
    // Conformance to `Hashable`
    static func == (lhs: WindowView, rhs: WindowView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id) // Typically, the unique identifier is sufficient for hashing.
    }
    
    @Published var enable24H: Bool {
        didSet {
            UserDefaults.standard.set(enable24H, forKey: UserDefaults.Keys.enable24H, windowID: self.id)
        }
    }
    
    @Published var showBatteryInfo: Bool {
        didSet {
            UserDefaults.standard.set(showBatteryInfo, forKey: UserDefaults.Keys.showBatteryInfo, windowID: self.id)
        }
    }
    
    @Published var showSecond: Bool {
        didSet {
            UserDefaults.standard.set(showSecond, forKey: UserDefaults.Keys.showSecond, windowID: self.id)
        }
    }
    
    @Published var timeZone: String {
        didSet {
            UserDefaults.standard.set(timeZone, forKey: UserDefaults.Keys.timeZone, windowID: self.id)
        }
    }
}


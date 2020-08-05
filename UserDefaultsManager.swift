class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    public enum Key {
        var rawValue: String { return "\(self)" }
        case custom(String)
    }
    
    func getValue<T: Decodable>(_ key: Key, model: T.Type) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key.rawValue) else { return nil }
        return try? JSONDecoder().decode(model, from: data)
    }
    
   func setValue<T: Encodable>(key: Key, data: T) throws {
        let data = try JSONEncoder().encode(data)
        UserDefaults.standard.set(data, forKey: key.rawValue)
    }
    
    func remove(key: Key) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    func remove(keys: [Key]) {
        for key in keys {
            remove(key: key)
        }
    }
}

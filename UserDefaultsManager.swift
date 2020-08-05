import Foundation

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

    func setValue<T: Codable>(key: Key, data: Storable<T>) {
        guard let data = try? JSONEncoder().encode(data) else { return }
        UserDefaults.standard.set(data, forKey: key.rawValue)
    }

    func remove(key: Key) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}

public struct Storable<T: Codable>: Codable {
    let value: T
}

import Foundation
import Security

struct TVStorage {
    private static let key = "name.arthurgalustian.Remote-for-LG"

    static func save(tvs: [TV]) -> Bool {
        guard let data = try? JSONEncoder().encode(tvs) else { return false }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
        ]

        SecItemDelete(query as CFDictionary)

        var attributes = query
        attributes[kSecValueData as String] = data

        let status = SecItemAdd(attributes as CFDictionary, nil)
        return status == errSecSuccess
    }

    static func load() -> [TV] {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status == errSecSuccess,
              let data = item as? Data,
              let tvs = try? JSONDecoder().decode([TV].self, from: data)
        else {
            return []
        }
        return tvs
    }
}

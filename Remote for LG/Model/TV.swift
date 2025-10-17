struct TV: Codable, Equatable, Hashable, Identifiable {
    var name: String
    var location: String
    var ip: String

    var id: String { ip }
}

struct Envelope<T: Codable>: Codable {
    var status: String
    var copyright: String
    var response: T
}

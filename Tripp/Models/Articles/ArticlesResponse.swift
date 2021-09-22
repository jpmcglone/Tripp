struct ArticlesResponse: Codable {
    var articles: [Article]
    var meta: Meta
    
    // ...
    
    enum CodingKeys: String, CodingKey {
        case articles = "docs"
        case meta
    }
}


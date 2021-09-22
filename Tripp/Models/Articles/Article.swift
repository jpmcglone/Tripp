import Foundation

struct Article: Codable {
    let webURL: String
    let snippet, leadParagraph: String
    let height: Int
    let headline: Headline
    let multimedia: [Multimedia]
    let pubDate: String?
    
    // ...
    
    let mobileImage: String?
    var mobileImageUrl: URL? {
        URL(string: mobileImage ?? "")
    }

    enum CodingKeys: String, CodingKey {
        case webURL = "web_url"
        case snippet
        case leadParagraph = "lead_paragraph"
        case headline
        case multimedia
        case pubDate = "pub_date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        webURL = try container.decode(String.self, forKey: .webURL)
        snippet = try container.decode(String.self, forKey: .snippet)
        leadParagraph = try container.decode(String.self, forKey: .leadParagraph)
        headline = try container.decode(Headline.self, forKey: .headline)
        multimedia = try container.decode([Multimedia].self, forKey: .multimedia)
        pubDate = try container.decode(String.self, forKey: .pubDate)
        
        let filteredMultiMedia = multimedia.filter {
            $0.subType == "xlarge"
        }
        
        if (filteredMultiMedia.count > 0) {
            // TODO: Construct this better
            mobileImage = "https://www.nytimes.com/" + filteredMultiMedia[0].url
            height = filteredMultiMedia[0].height
        } else {
            mobileImage = nil
            height = 0
        }
    }
}

import Alamofire
import Combine
import SwiftUI

private var baseUrl = URL(string: "https://api.nytimes.com")!

class ArticleService: ObservableObject {
    var fetchArticlesCancellable: AnyCancellable?
    
    let api: APIClient
    let apiKey: String
    
    var isFetchingArticles: Bool {
        fetchArticlesCancellable != nil
    }
    
    @Published var articles: [Article] = []
    
    init(apiKey: String) {
        self.apiKey = apiKey
        self.api = APIClient(baseUrl: baseUrl, baseParameters: ["api-key": apiKey])
    }
    
    func fetchArticles(withQuery query: String) {
        let uri = "svc/search/v2/articlesearch.json"
        let parameters = ["q": query]
        
        fetchArticlesCancellable = api
            .get(uri, parameters: parameters)
            .sink { completion in
                self.fetchArticlesCancellable = nil
            } receiveValue: { (envelope: Envelope<ArticlesResponse>) in
                self.articles = envelope.response.articles
            }
    }
}

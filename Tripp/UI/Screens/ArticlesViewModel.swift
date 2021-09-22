import Combine
import SwiftUI

class ArticlesViewModel: ObservableObject {
    @Published private var service: ArticleService
    var cancellables = Set<AnyCancellable>()
    
    @Published var query: String = ""
    @Published var articles: [Article] = []
    
    init(service: ArticleService) {
        self.service = service
        setupPublishers()
    }
    
    func setupPublishers() {
        $query
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink(receiveValue: fetch)
            .store(in: &cancellables)
        
        service
            .$articles
            .sink { self.articles = $0 }
            .store(in: &cancellables)
    }
    
    private func fetch(withQuery query: String) {
        service.fetchArticles(withQuery: query)
    }
}

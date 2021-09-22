import SwiftUI

@main
struct TrippApp: App {
    @StateObject var articlesViewModel: ArticlesViewModel
    
    init() {
        let articlesService = ArticleService(
            apiKey: "AmGyRUolA0PvrJK5hrfAweLzqjmIfp7E"
        )
        
        _articlesViewModel = StateObject(wrappedValue: ArticlesViewModel(service: articlesService))
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ArticlesView(model: articlesViewModel)
            }
            .preferredColorScheme(.light)
        }
    }
}

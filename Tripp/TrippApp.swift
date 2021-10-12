import SwiftUI

@main
struct TrippApp: App {
    @StateObject var articlesViewModel: ArticlesViewModel
    
    init() {
        let articlesService = ArticleService(
            apiKey: Config.NYTimes.apiKey
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

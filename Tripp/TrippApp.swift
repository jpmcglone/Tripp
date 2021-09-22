import SwiftUI

@main
struct TrippApp: App {
    @StateObject var articles = ArticleService(
        apiKey: "AmGyRUolA0PvrJK5hrfAweLzqjmIfp7E"
    )
    
    var body: some Scene {
        WindowGroup {
            ArticlesView()
                .environmentObject(articles)
        }
    }
}

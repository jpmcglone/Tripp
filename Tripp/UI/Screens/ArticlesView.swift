import SwiftUI

public struct ArticlesView: View {    
    @ObservedObject var model: ArticlesViewModel
    
    public var body: some View {
        VStack(alignment: .center) {
            searchBar
            
            if model.articles.isEmpty {
                empty
            } else {
                results
            }
        }
        .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude, alignment: .topLeading)
        .navigationBarHidden(true)
    }
    
    var searchBar: some View {
        // TODO: Make into configurable component
        HStack(spacing: 5) {
            Image(systemName: "magnifyingglass")
            TextField("Enter Keyword for News Search", text: $model.query)
        }
        .frame(height: 44)
        .padding()
    }
    
    var results: some View {
        ScrollView {
            VStack(spacing: 5) {
                ForEach(model.articles, id: \.webURL) {
                    ArticleItem(article: $0)
                }
            }
            .padding(.horizontal, 5)
        }
        .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude, alignment: .topLeading)
        .padding(.bottom, 5)
    }
    
    var empty: some View {
        let text: String
        if model.articles.count == 0 {
            text = "Enter your query and wait"
        } else {
            text = "No results"
        }
        
        return Text(text)
            .font(.caption)
            .foregroundColor(Color.black.opacity(0.2))
    }
}

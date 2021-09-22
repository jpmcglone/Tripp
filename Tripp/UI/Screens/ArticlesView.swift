import SwiftUI

public struct ArticlesView: View {    
    @ObservedObject var model: ArticlesViewModel
    
    public var body: some View {
        VStack(alignment: .center) {
            searchBar
            
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
}

#if DEBUG
public struct ArticlesView_Previews: PreviewProvider {
    static var model = ArticlesViewModel(service: ArticleService(apiKey: ""))
    
    public static var previews: some View {
        ArticlesView(model: model)
    }
}
#endif

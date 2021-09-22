import SwiftUI
import SDWebImageSwiftUI

struct ArticleItem: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            if article.mobileImageUrl != nil {
                AnimatedImage(url: article.mobileImageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .greatestFiniteMagnitude)
                    .clipped()
                
                Spacer().frame(height: 10)
            }
                  
            Text(article.headline.main)
                .lineLimit(nil)
                .padding(10)
        }
        .frame(maxWidth: .greatestFiniteMagnitude, alignment: .topLeading)
        .background(Color.black.opacity(0.1))
        .cornerRadius(7)
    }
}

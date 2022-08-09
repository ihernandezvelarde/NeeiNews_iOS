//
//  APICaller.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 25/7/22.
//

import Foundation
final class APICaller {
    static let shared = APICaller()
    struct Constants{
        static let topHeadLinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=US&apiKey=b0081229f02648eb81057b78f3de9b87")
    }
    private init() { }
    public func getTopStories(completion: @escaping([Article]) -> Void) {
        guard let url = Constants.topHeadLinesURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, _, error in if let error = error {
            } else if let data = data {
                do{
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    let newsTitles: [String] = [result.articles[0].title ?? "", result.articles[1].title ?? "",result.articles[2].title ?? "",result.articles[3].title ?? "",result.articles[4].title ?? "",result.articles[5].title ?? "",result.articles[6].title ?? ""]
                    let newsDescription: [String] = [result.articles[0].description ?? "",result.articles[1].description ?? "",result.articles[2].description ?? "",result.articles[3].description ?? "",result.articles[4].description ?? "",result.articles[5].description ?? "",result.articles[6].description ?? ""]
                    let publishedAt: [String] = [result.articles[0].publishedAt ?? "", result.articles[1].publishedAt ?? "",result.articles[2].publishedAt ?? "",result.articles[3].publishedAt ?? "",result.articles[4].publishedAt ?? "",result.articles[5].publishedAt ?? "",result.articles[6].publishedAt ?? ""]
                    let image: [String] = [result.articles[0].urlToImage ?? "", result.articles[1].urlToImage ?? "",result.articles[2].urlToImage ?? "",result.articles[3].urlToImage ?? "",result.articles[4].urlToImage ?? "",result.articles[5].urlToImage ?? "",result.articles[6].urlToImage ?? ""]
                    let newsContent: [String] = [result.articles[0].content ?? "",result.articles[1].content ?? "",result.articles[2].content ?? "",result.articles[3].content ?? "",result.articles[4].content ?? "",result.articles[5].content ?? "",result.articles[6].content ?? ""]
                    let link: [String] = [result.articles[0].url ?? "", result.articles[1].url ?? "",result.articles[2].url ?? "",result.articles[3].url ?? "",result.articles[4].url ?? "",result.articles[5].url ?? "",result.articles[6].url ?? ""]
                    
                    print(newsTitles)
                    print(newsDescription)
                    print(publishedAt)
                    print(image)
                    print(link)
                    print(newsContent)
                    completion(result.articles)
                }
                catch{
                }
            }
        }
        task.resume()
    }
}
struct APIResponse: Codable {
    let articles: [Article]
}
struct Article: Codable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
    let publishedAt: String?
    let source: Source
}
struct Source: Codable {
    let id: String?
    let name: String?
}


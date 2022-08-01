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
                    let newsFirstLine: [String] = [result.articles[0].description ?? "",result.articles[1].description ?? "",result.articles[2].description ?? "",result.articles[3].description ?? "",result.articles[4].description ?? "",result.articles[5].description ?? "",result.articles[6].description ?? ""]
                    let newsSecondLine: [String] = [result.articles[0].content ?? "",result.articles[1].content ?? "",result.articles[2].content ?? "",result.articles[3].content ?? "",result.articles[4].content ?? "",result.articles[5].content ?? "",result.articles[6].content ?? ""]
                    print(newsTitles)
                    print(newsFirstLine)
                    print(newsSecondLine)
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
    let source: Source
}
struct Source: Codable {
    let id: String?
    let name: String?
}


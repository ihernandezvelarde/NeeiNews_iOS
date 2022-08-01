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
        var resultTitle = ""
        guard let url = Constants.topHeadLinesURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, _, error in if let error = error {
            }
            else if let data = data {
                do{
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    resultTitle = result.articles[0].title ?? ""
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


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
    var title: String? = "Cargando"
    var description: String? = "Cargando"
    var url: String? = "Cargando"
    var urlToImage: String = "Cargando"
    var content: String? = "Cargando"
    var publishedAt: String? = "Cargando"
    var source: Source = Source(id: "Id", name: "Name")
}
struct Source: Codable {
    let id: String?
    let name: String?
}


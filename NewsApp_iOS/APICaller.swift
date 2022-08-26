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
        static let topHeadLinesURL = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-08-25&to=2022-08-25&sortBy=popularity&apiKey=b0081229f02648eb81057b78f3de9b87")
        //https://newsapi.org/v2/everything?q=tesla&from=2022-07-24&sortBy=publishedAt&apiKey=b0081229f02648eb81057b78f3de9b87
        
        //https://newsapi.org/v2/top-headlines?country=US&apiKey=b0081229f02648eb81057b78f3de9b87
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



//
//  Utils.swift
//  NewsApp_iOS
//
//  Created by Irene on 24/8/22.
//

import Foundation

class Utils {
    
    func factory(number: Int) -> [Article] {
        let config = UtilsConfig()
        var array: [Article] = []
        let randomText = config.text.randomElement()!
        for i in 0...number {
            array.append(Article.init(title: ("Title \(i)"), description: config.description, url: config.url, urlToImage: "", content: randomText, publishedAt: config.published, source: Source(id: "Id", name: "Name")))
        }
        return array
      }
}


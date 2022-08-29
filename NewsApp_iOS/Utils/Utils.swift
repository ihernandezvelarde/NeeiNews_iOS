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
        for i in 0...number {
            array.append(Article.init(title: config.title, description: config.text, url: config.url, urlToImage: "wrong", content: config.text, publishedAt: config.published, source: Source(id: "Id", name: "Name")))
        }
        return array
      }
}


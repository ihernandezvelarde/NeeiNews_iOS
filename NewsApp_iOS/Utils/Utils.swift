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
            array.append(Article.init(title: ("Title\(i)"), description: "This is the description", url: "The URL", urlToImage: "", content: randomText, publishedAt: "24-08-2022 11:00:05", source: Source(id: "Id", name: "Name")))
        }
        return array
      }
}


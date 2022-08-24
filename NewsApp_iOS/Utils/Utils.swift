//
//  Utils.swift
//  NewsApp_iOS
//
//  Created by Irene on 24/8/22.
//

import Foundation

class Utils {
    func factory(number: Int) -> [Article] {
        var array: [Article] = []
        for i in 0...number {
            array.append(Article.init(title: ("Title\(i)"), description: "bla", url: "bla", urlToImage: "bla", content: "bla", publishedAt: "bla", source: Source(id: "Id", name: "Name")))
        }
        return array
      }
}


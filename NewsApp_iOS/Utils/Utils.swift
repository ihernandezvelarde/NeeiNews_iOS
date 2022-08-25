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
            array.append(Article.init(title: ("Title \(i)"), description: config.description, url: config.url, urlToImage: "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/84e6fb0df7c721a1b5176e8a1e985674.jpg", content: randomText, publishedAt: config.published, source: Source(id: "Id", name: "Name")))
        }
        return array
      }
}


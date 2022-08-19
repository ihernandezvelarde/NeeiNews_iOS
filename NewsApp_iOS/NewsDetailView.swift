//
//  NewsDetailView.swift
//  NewsApp_iOS
//
//  Created by Irene on 9/8/22.
//

import Foundation
import UIKit
class NewsDetailView: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    var newsTitle = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsDescription = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsPublishedAt = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsPhoto = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsContent = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsLink = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    
    internal func generate(articles: [Article]) {
        for i in 0...6 {
            newsTitle[i] = articles[i].title ?? ""
            newsDescription[i] = articles[i].description ?? ""
            newsPublishedAt[i] = articles[i].publishedAt ?? ""
            newsPhoto[i] = articles[i].urlToImage ?? ""
            newsContent[i] = articles[i].content ?? ""
            newsLink[i] = articles[i].url ?? ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
//        let cell = CarrouselCell()
////        APICaller.shared.getTopStories { result in
////            cell.generate(articles: result)
//            self.newsTitleDetail = cell.newsTitle
//            print("AQUI\(self.newsTitleDetail)")
//            //self.titleLabel.text = self.newsTitleDetail[0]
        //titleLabel.text = newsTitle[0]
        //descriptionLabel.text = newsDescription[0]
    }
 
}

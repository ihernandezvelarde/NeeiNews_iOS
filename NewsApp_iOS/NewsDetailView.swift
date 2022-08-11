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
    var newsTitleDetail = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsDescriptionDetail = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsPublishedAtDetail = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsPhotoDetail = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsContentDetail = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsLinkDetail = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cell = CarrouselCell()
        APICaller.shared.getTopStories { result in
            cell.generate(articles: result)
            self.newsTitleDetail = cell.newsTitle
            print("AQUI\(self.newsTitleDetail)")
            //self.titleLabel.text = self.newsTitleDetail[0]
        }
    }
   
}

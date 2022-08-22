//
//  ModalViewController.swift
//  NewsApp_iOS
//
//  Created by Irene on 19/8/22.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    //@IBOutlet weak var descriptionLabel: UILabel!
    //@IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    var rawTitle: String?
    var rawPhoto: String?
    var rawContent: String?
    var rawLink: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = rawTitle
        newsImage.image = UIImage(named: rawPhoto ?? "NO PHOTO")
        contentLabel.text = rawContent
        linkLabel.text = rawLink
    }
    
    public convenience init(articles: [Article]) {
        self.init()
        for i in 0...6 {
            self.rawTitle = articles[i].title ?? ""
            //self.rawDescription = articles[i].description ?? ""
            //self.rawPublishedAt = articles[i].publishedAt ?? ""
            self.rawPhoto = articles[i].urlToImage ?? ""
            self.rawContent = articles[i].content ?? ""
            self.rawLink = articles[i].url ?? ""
        }
    }

}

//
//  ModalViewController.swift
//  NewsApp_iOS
//
//  Created by Irene on 19/8/22.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var myTitleLabel: UILabel!
    //@IBOutlet weak var descriptionLabel: UILabel!
    //@IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var closeModalButton: UIButton!
    
    var article = Article()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi(article: self.article)

    }
    
    public convenience init(article: Article) {
        self.init()
        self.article = article
    }
    
    func setUpUi(article: Article){
        myTitleLabel.text = article.title
        newsImage.image = UIImage(named: article.urlToImage)
    }
    
    @IBAction func closeModalView(_ sender: Any) {
        dismiss(animated: true)
    }
}

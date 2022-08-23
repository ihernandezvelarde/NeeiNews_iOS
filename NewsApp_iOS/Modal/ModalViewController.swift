//
//  ModalViewController.swift
//  NewsApp_iOS
//
//  Created by Irene on 19/8/22.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var myTitleLabel: UILabel!
    @IBOutlet weak var myDescriptionLabel: UILabel!
    @IBOutlet weak var myNewsImage: UIImageView!
    @IBOutlet weak var myContentLabel: UILabel!
    @IBOutlet weak var myLinkLabel: UILabel!
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
        myDescriptionLabel.text = article.description
        let url = URL(string: article.urlToImage)
        let data = try? Data(contentsOf: url!)
        if data != nil {
            myNewsImage.image = UIImage(data: data!)
        } else {
            myNewsImage.image = UIImage(named: "wrong")
        }
        
        myContentLabel.text = article.content
        myLinkLabel.text = article.url
    }
    
    @IBAction func closeModalView(_ sender: Any) {
        dismiss(animated: true)
    }
}

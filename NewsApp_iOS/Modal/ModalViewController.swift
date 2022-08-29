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
    @IBOutlet weak var closeModalButton: UIButton!
    
    @IBOutlet weak var myPublishedAtLabel: UILabel!
    @IBOutlet weak var linkButton: UIButton!
    
    @IBOutlet weak var myTodayLabel: UILabel!
    
    var article = Article()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myNewsImage.layer.cornerRadius = 10
        linkButton.configuration?.cornerStyle = .capsule
        //linkButton.clipsToBounds = true
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
        if data != nil{
            myNewsImage.image = UIImage(data: data!)
        } else {
            myNewsImage.image = UIImage(named: "wrong")
        }
        myPublishedAtLabel.text = article.publishedAt
        myTodayLabel.text = "Today"
    }
    
    @IBAction func pressLinkButton(_ sender: UIButton) {
        if Reachability.isConnectedToNetwork() == true{
            print("Connected")
            if let url = URL(string: article.url ?? "") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("ERROR LOG: DetailViewController button wikiURL launch failed: safe link not found")
            }
        }else{
            let controller = UIAlertController(title: "No Internet Detected", message: "This link requires an Internet connection", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            //let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            controller.addAction(ok)
            //controller.addAction(cancel)

            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func closeModalView(_ sender: Any) {
        dismiss(animated: true)
    }
}


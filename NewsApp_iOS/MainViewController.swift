//
//  ViewController.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 6/7/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var newsTitle: [String] = ["Title 1","Title 2","Title 3","Title 4","Title 5","Title 6","Title 7"]
    var newsFirstLine = "This is the first line, this is the first line"
    var newsSecondLine = "This is the second line, this is the second line"
    @IBOutlet weak var collectionView: UICollectionView!
    let launchImage = UIImageView(image: UIImage(named: "news_icon")!)
    let splashView = UIView()
    
    @IBOutlet weak var simpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashView.backgroundColor = UIColor(red: 209/255, green: 209/255, blue: 214/255, alpha: 1.0)
        view.addSubview(splashView)
        launchImage.contentMode = .scaleAspectFit
        splashView.addSubview(launchImage)
        splashView.removeFromSuperview()
    
        // FIXME: -- Change background color when design it's done.
        simpleView.backgroundColor = .green
    }
}
//extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return newsTitle.count
//    }
//    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarrouselCell", for: indexPath) as! CarrouselCell
//        cell.newsTitleLabel.text = newsTitle[indexPath.row]
//        cell.newsFirstLineLabel.text = newsFirstLine
//        cell.newsSecondLineLabel.text = newsSecondLine
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//    }
//
//}

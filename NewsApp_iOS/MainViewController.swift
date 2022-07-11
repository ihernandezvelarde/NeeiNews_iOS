//
//  ViewController.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 6/7/22.
//

import UIKit

class MainViewController: UIViewController {
    //var currentCellIndex = 0
    var newsTitle: [String] = ["Title 1","Title 2","Title 3","Title 4","Title 5","Title 6","Title 7"]
    var newsFirstLine = "This is the first line"
    var newsSecondLine = "This is the second line"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    let launchImage = UIImageView(image: UIImage(named: "news_icon")!)
    let splashView = UIView()
    
    @IBOutlet weak var simpleView: UIView!
    //var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashView.backgroundColor = UIColor(red: 209/255, green: 209/255, blue: 214/255, alpha: 1.0)
        view.addSubview(splashView)
        launchImage.contentMode = .scaleAspectFit
        splashView.addSubview(launchImage)
        splashView.removeFromSuperview()
    
        // FIXME: -- Change background color when design it's done.
        simpleView.backgroundColor = .green
        //timer = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
//    @objc func slideToNext() {
//        if currentCellIndex < newsTitle.count-1 {
//            currentCellIndex = currentCellIndex + 1
//        }else {
//            currentCellIndex = 0
//        }
//        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
//    }
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarrouselCell", for: indexPath) as! CarrouselCell
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "LinksCell", for: indexPath) as! LinksCell
        
        if indexPath.row == 1 {
            cell2.labelprueba.text = "CELDA DOS"
            return cell2
        }
        
        if indexPath.row == 2 {
            return cell3
        }
        
        cell.newsTitleLabel.text = newsTitle[indexPath.row]
        cell.newsFirstLine.text  = newsFirstLine
        cell.newsSecondLine.text = newsSecondLine
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

}

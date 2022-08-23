//
//  ViewController.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 6/7/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var simpleView: UIView!
    
    var config = MainConfig()
    
    let launchImage = UIImageView(image: UIImage(named: "news_icon")!)
    let splashView = UIView()
    var articlesArrray: [Article] = []
    
    override func viewDidAppear(_ animated: Bool) {
        if Reachability.isConnectedToNetwork() == true {
            print("Connected")
        }else {
            let controller = UIAlertController(title: "No Internet Detected", message: "This app requires an Internet connection", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(ok)
            present(controller, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashView.backgroundColor = UIColor(red: CGFloat(config.redColor), green: CGFloat(config.greenColor), blue: CGFloat(config.blueColor), alpha: 1.0)
        view.addSubview(splashView)
        launchImage.contentMode = .scaleAspectFit
        splashView.addSubview(launchImage)
        splashView.removeFromSuperview()
    
        // FIXME: -- Change background color when design it's done.
        simpleView.backgroundColor = .purple
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.bounces = scrollView.contentOffset.y > CGFloat(config.bounceY)
        scrollView.bounces = scrollView.contentOffset.x > CGFloat(config.bounceX)
    }
    
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
        
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return config.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var vc = UIViewController()
        if articlesArrray.count != 0 {
            vc = ModalViewController(article: articlesArrray[indexPath.row])
        } else {
            vc = ModalViewController(article: Article())
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "outherCell", for: indexPath) as? CarrouselCell {
            APICaller.shared.getTopStories { result in
                    cell.generate(articles: result)
                    self.articlesArrray = result
            }
            
        if let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as? ButtonCell {
            if indexPath.row == 1 {
                return cell2
            }
        }
            
        if let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "LinksCell", for: indexPath) as? LinksCell {
            
            if indexPath.row == 2 {
                return cell3
            }
        }
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: config.widthLayout, height: config.heightLayout)
    }
}

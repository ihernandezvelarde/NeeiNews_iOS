//
//  ViewController.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 6/7/22.
//

import UIKit

class MainViewController: UIViewController {
   
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
        simpleView.backgroundColor = .purple

    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.bounces = scrollView.contentOffset.y > 100
        scrollView.bounces = scrollView.contentOffset.x > 100
    }
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
        
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //TODO: - MOSTRAR LOS 3 TIPOS DE CELDA.
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "outherCell", for: indexPath) as? CarrouselCell {
            APICaller.shared.getTopStories { result in
                    cell.generate(articles: result)
                    print(result)
            }
            
            return cell
        } else{
            return UICollectionViewCell()
        }
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "LinksCell", for: indexPath) as! LinksCell
        
        if indexPath.row == 1 {
            return cell2
        }
        
        if indexPath.row == 2 {
            return cell3
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 165)
    }


}

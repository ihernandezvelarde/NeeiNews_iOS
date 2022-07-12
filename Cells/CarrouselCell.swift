//
//  CarrouselCell.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 11/7/22.
//

import UIKit

class CarrouselCell: UICollectionViewCell{//, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    
//    //var currentCellIndex = 0
//    var newsTitle: [String] = ["Title 1","Title 2","Title 3","Title 4","Title 5","Title 6","Title 7"]
//    var newsFirstLine = "This is the first line"
//    var newsSecondLine = "This is the second line"
//
//    @IBOutlet weak var carrouselCollectionView: UICollectionView!
//    public override func awakeFromNib() {
//        super.awakeFromNib()
////      timer = Timer.scheduledTimer(timeInterval: 8.0, target: NewsCarrousel.self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
//
//        let nibCell = UINib(nibName: "carrouselCollectionView", bundle: nil)
//        self.carrouselCollectionView.register(nibCell, forCellWithReuseIdentifier: "NewsCarrousel")
//        self.carrouselCollectionView.dataSource = self
//        self.carrouselCollectionView.delegate = self
//
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
//        self.carrouselCollectionView.collectionViewLayout = layout
//    }
//
////        @objc func slideToNext() {
////            if currentCellIndex < newsTitle.count-1 {
////                currentCellIndex = currentCellIndex + 1
////            }else {
////                currentCellIndex = 0
////            }
////            carrouselCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
////        }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return newsTitle.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCarrousel", for: indexPath) as! NewsCarrousel
////        cell.newsTitleLabel.text = newsTitle[indexPath.row]
////        cell.newsFirstLineLabel.text  = newsFirstLine
////        cell.newsSecondLineLabel.text = newsSecondLine
////
//        return cell
//    }
//    func collectionView(_ carrouselCollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: carrouselCollectionView.frame.width, height: carrouselCollectionView.frame.height)
//    }
}

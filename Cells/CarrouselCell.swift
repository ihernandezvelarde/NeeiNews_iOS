//
//  CarrouselCell.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 11/7/22.
//

import UIKit

class CarrouselCell: UICollectionViewCell {
    @IBOutlet weak var carrouselCollectionView: UICollectionView!
    //    //var currentCellIndex = 0
    var newsTitle: [String] = ["Title 1","Title 2","Title 3","Title 4","Title 5","Title 6","Title 7"]
    var newsFirstLine = "This is the first line"
    var newsSecondLine = "This is the second line"

    public override func awakeFromNib() {
        super.awakeFromNib()
////      timer = Timer.scheduledTimer(timeInterval: 8.0, target: NewsCarrousel.self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
//
////        @objc func slideToNext() {
////            if currentCellIndex < newsTitle.count-1 {
////                currentCellIndex = currentCellIndex + 1
////            }else {
////                currentCellIndex = 0
////            }
////            carrouselCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
////        }
    
}
extension CarrouselCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ carrouselCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ carrouselCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carrouselCollectionView.dequeueReusableCell(withReuseIdentifier: "celdita", for: indexPath) as! celdita
        cell.newsTitleLabel.text = newsTitle[indexPath.row]
        cell.newsFirstLineLabel.text  = newsFirstLine
        cell.newsSecondLineLabel.text = newsSecondLine
        return cell
    }
    func collectionView(_ carrouselCollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 165)
    }
}

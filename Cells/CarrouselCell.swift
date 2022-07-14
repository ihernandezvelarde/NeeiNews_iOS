//
//  CarrouselCell.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 11/7/22.
//

import UIKit

class CarrouselCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet weak var carrouselCollectionView: UICollectionView!
    var currentCellIndex = 0
    var newsTitle: [String] = ["Title 1","Title 2","Title 3","Title 4","Title 5","Title 6","Title 7"]
    var newsFirstLine = "This is the first line"
    var newsSecondLine = "This is the second line"
    var timer : Timer?

    public override func awakeFromNib() {
        super.awakeFromNib()
        carrouselCollectionView.delegate = self
        carrouselCollectionView.dataSource = self
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.carrouselCollectionView.collectionViewLayout = layout
    }
    @objc func slideToNext() {
        if currentCellIndex < newsTitle.count-1 {
            currentCellIndex = currentCellIndex + 1
        }else {
            currentCellIndex = 0
        }
            carrouselCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsTitle.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "innerCell", for: indexPath) as! celdita
        cell.newsTitleLabel.text = newsTitle[indexPath.row]
        cell.newsFirstLineLabel.text  = newsFirstLine
        cell.newsSecondLineLabel.text = newsSecondLine
        return cell
    }

}
extension CarrouselCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 128)
    }
    
////      timer = Timer.scheduledTimer(timeInterval: 8.0, target: NewsCarrousel.self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
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

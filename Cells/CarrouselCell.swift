//
//  CarrouselCell.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 11/7/22.
//

import UIKit

class CarrouselCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet weak var carrouselCollectionView: UICollectionView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        carrouselCollectionView.delegate = self
        carrouselCollectionView.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "innerCell", for: indexPath) as! celdita
        //cell.newsTitleLabel.text = newsTitle[indexPath.row]
        //cell.newsFirstLineLabel.text  = newsFirstLine
        //cell.newsSecondLineLabel.text = newsSecondLine
        return cell
    }

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
    


//
//  NewsCarrouselCell.swift
//  NewsApp_iOS
//
//  Created by Irene on 25/8/22.
//

import UIKit

class NewsCarrouselCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //@IBOutlet weak var myPageControll: UIPageControl!
    
    
    var currentCellIndex = 0
    var timer : Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.isScrollEnabled = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.myCollectionView.collectionViewLayout = layout
        startTimer()
        //myPageControll.numberOfPages = 6
    }
    
    func startTimer(){
           timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
       }
       @objc func slideToNext() {
           if currentCellIndex < 6 - 1 {
               currentCellIndex = currentCellIndex + 1
               timer?.invalidate()
               startTimer()
           
           }else {
               currentCellIndex = 0
               timer?.invalidate()
               startTimer()
           }
           myCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
   //            timer?.invalidate()
   //            startTimer()
       }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inner", for: indexPath)
            cell.backgroundColor = .red
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print(indexPath)
        }
    }
extension NewsCarrouselCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 409, height: 128)
    }

}

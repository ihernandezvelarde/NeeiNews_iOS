//
//  CarrouselCell.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 11/7/22.
//

import UIKit
import Foundation

class News {
    let title: String = ""
    let subtitle: String = ""
    let description: String = ""
}


class CarrouselCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
        
    var currentCellIndex = 0
    var theNews : News?
    var newsTitle: [String] = ["Title 1","Title 2","Title 3","Title 4","Title 5","Title 6","Title 7"]
    var newsFirstLine = "This is the first line"
    var newsSecondLine = "This is the second line"
    var timer : Timer?
    
    @IBOutlet weak var carrouselCollectionView: UICollectionView!
    @IBOutlet weak var myPageControll: UIPageControl!
    @IBOutlet weak var arrowRightButton: UIButton!
    @IBOutlet weak var arrowLeftButton: UIButton!
    
    @IBOutlet weak var newsAccesButton: UIButton!

    public override func awakeFromNib() {
        super.awakeFromNib()
        
        if arrowLeftButton != nil && arrowRightButton != nil{
        arrowLeftButton.setImage(UIImage(named: "arrow.left.circle"), for: .normal)
        arrowRightButton.setImage(UIImage(named: "arrow.right.circle"), for: .normal)
        
        }
        carrouselCollectionView.delegate = self
        carrouselCollectionView.dataSource = self
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.carrouselCollectionView.collectionViewLayout = layout
        myPageControll.numberOfPages = newsTitle.count
        newsAccesButton.setTitle("", for: .normal)
        APICaller.shared.getTopStories { result in
            switch result {
            case .success(_):
                break
            case.failure(let error):
                print(error)
            }
        }
    }
    @objc func slideToNext() {
        if currentCellIndex < newsTitle.count-1 {
            currentCellIndex = currentCellIndex + 1
        }else {
            currentCellIndex = 0
        }
            myPageControll.currentPage = currentCellIndex
            carrouselCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsTitle.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "innerCell", for: indexPath) as! InnerCell
        cell.newsTitleLabel.text = theNews?.title//newsTitle[indexPath.row]
        cell.newsFirstLineLabel.text  = theNews?.subtitle//newsFirstLine
        cell.newsSecondLineLabel.text = theNews?.description//newsSecondLine
        return cell
    }

    @IBAction func scrollLeftCarrousel(_ sender: UIButton) {
        if currentCellIndex <= newsTitle.count - 1 {
            currentCellIndex = currentCellIndex - 1
        }else {
            currentCellIndex = 0
        }
            myPageControll.currentPage = currentCellIndex
            carrouselCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .left, animated: true)
    }
    
    @IBAction func scrollRightCarrousel(_ sender: UIButton) {
        if currentCellIndex < newsTitle.count - 1 {
            currentCellIndex = currentCellIndex + 1
        }else {
            currentCellIndex = 0
        }
            myPageControll.currentPage = currentCellIndex
            carrouselCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
    
    @IBAction func newsAccesActionButton(_ sender: UIButton) {
        print("THE NEWS ACCES ACTION BUTTON IS PRESSED")
    }
}
extension CarrouselCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 128)
    }
}

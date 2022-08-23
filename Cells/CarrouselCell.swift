//
//  CarrouselCell.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 11/7/22.
//

import UIKit
import Foundation



class CarrouselCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var carrouselCollectionView: UICollectionView!
    @IBOutlet weak var myPageControll: UIPageControl!
    @IBOutlet weak var arrowRightButton: UIButton!
    @IBOutlet weak var arrowLeftButton: UIButton!
    
    var currentCellIndex = 0
    var article = Article()
    var articlesArray: [Article]? = []
    var timer : Timer?
    var config = CarrouselConfig()
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        if arrowLeftButton != nil && arrowRightButton != nil{
            arrowLeftButton.setImage(UIImage(named: config.arrowLeft), for: .normal)
            arrowRightButton.setImage(UIImage(named: config.arrowRight), for: .normal)
        }
        carrouselCollectionView.delegate = self
        carrouselCollectionView.dataSource = self
        carrouselCollectionView.isScrollEnabled = false
        startTimer()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.carrouselCollectionView.collectionViewLayout = layout
        myPageControll.numberOfPages = config.numberOfNews
        
    }
    
    internal func generate(articles: [Article]) {
        self.articlesArray = articles
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
    @objc func slideToNext() {
        if currentCellIndex < config.numberOfNews - 1 {
            currentCellIndex = currentCellIndex + 1
            timer?.invalidate()
            startTimer()
            
        }else {
            currentCellIndex = config.cero
            timer?.invalidate()
            startTimer()
        }
            myPageControll.currentPage = currentCellIndex
        carrouselCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: config.cero), at: .right, animated: true)
            timer?.invalidate()
            startTimer()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return config.numberOfNews
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "innerCell", for: indexPath) as? InnerCell
    
        if articlesArray?.count != config.cero {
            cell?.generate(article: articlesArray?[indexPath.row] ?? article)
        } else {
            cell?.generate(article: article)
        }
        
        return cell ?? UICollectionViewCell()
    }
    @IBAction func scrollLeftCarrousel(_ sender: UIButton) {
        if currentCellIndex <= config.numberOfNews - 1 {
            currentCellIndex = currentCellIndex - 1
            timer?.invalidate()
            startTimer()
        }else {
            currentCellIndex = config.cero
            timer?.invalidate()
            startTimer()
        }
            myPageControll.currentPage = currentCellIndex
        carrouselCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: config.cero), at: .left, animated: true)
            timer?.invalidate()
            startTimer()
    }
    
    @IBAction func scrollRightCarrousel(_ sender: UIButton) {
        if currentCellIndex < config.numberOfNews - 1 {
            currentCellIndex = currentCellIndex + 1
            timer?.invalidate()
            startTimer()
        }else {
            currentCellIndex = config.cero
            timer?.invalidate()
            startTimer()
        }
            myPageControll.currentPage = currentCellIndex
        carrouselCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: config.cero), at: .right, animated: true)
            timer?.invalidate()
            startTimer()
    }
}
extension CarrouselCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: config.widthLayout, height: config.heightLayout)
    }
}

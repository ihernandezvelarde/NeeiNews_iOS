//
//  NewsCarrouselCell.swift
//  NewsApp_iOS
//
//  Created by Irene on 25/8/22.
//

import UIKit

class NewsCarrouselCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var myPageControll: UIPageControl!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    
    var article = Article()
    var articlesArray: [Article]? = []
    var currentCellIndex = 0
    var timer : Timer?
    var config = CarrouselConfig()
  
    override func awakeFromNib() {
        super.awakeFromNib()
        leftButton.setImage(UIImage(named: config.arrowLeft), for: .normal)
        rightButton.setImage(UIImage(named: config.arrowRight), for: .normal)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.isScrollEnabled = false
        myCollectionView.backgroundColor = .red
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.myCollectionView.collectionViewLayout = layout
        startTimer()
        myPageControll.numberOfPages = 6
        print("AQUI\(article)")
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
           myPageControll.currentPage = currentCellIndex
           myCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
   //            timer?.invalidate()
   //            startTimer()
       }
    internal func generate(articles: [Article]) {
            self.articlesArray = articles
    }
    
    @IBAction func leftScroll(_ sender: UIButton) {
        if currentCellIndex <= 6 - 1 {
                   currentCellIndex = currentCellIndex - 1
                   timer?.invalidate()
                   startTimer()
               }else {
                   currentCellIndex = 0
                   timer?.invalidate()
                   startTimer()
               }
                   myPageControll.currentPage = currentCellIndex
               myCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .left, animated: true)
                   timer?.invalidate()
                   startTimer()
    }
    @IBAction func rightScroll(_ sender: UIButton) {
        if currentCellIndex < 6 - 1 {
                    currentCellIndex = currentCellIndex + 1
                    timer?.invalidate()
                    startTimer()
                }else {
                    currentCellIndex = 0
                    timer?.invalidate()
                    startTimer()
                }
                    myPageControll.currentPage = currentCellIndex
                myCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
                    timer?.invalidate()
                    startTimer()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inner", for: indexPath) as? Inner
              if articlesArray?.count != config.cero {
                  cell?.generate(article: articlesArray?[indexPath.row] ?? Utils().factory(number: 6)[indexPath.row])
              } else {
                  cell?.generate(article: Utils().factory(number: 6)[indexPath.row])
              }
              return cell ?? UICollectionViewCell()
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        var vc = UIViewController()
        if articlesArray?.count != 0 {
            vc = ModalViewController(article: articlesArray?[indexPath.row] ?? Utils().factory(number: 6)[indexPath.row])
        } else {
            vc = ModalViewController(article: Utils().factory(number: 6)[indexPath.row])
        }
        vc.modalPresentationStyle = .fullScreen
        MainViewController().present(vc, animated: true, completion: nil)
        }
    }
extension NewsCarrouselCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 409, height: 128)
    }

}

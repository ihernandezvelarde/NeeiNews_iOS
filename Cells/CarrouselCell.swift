//
//  CarrouselCell.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 11/7/22.
//

import UIKit
import Foundation

class CarrouselCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    var currentCellIndex = 0
    var newsTitle: [String] = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsDescription = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsPublishedAt = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsPhoto = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsContent = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsLink = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
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
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.carrouselCollectionView.collectionViewLayout = layout
        myPageControll.numberOfPages = newsTitle.count
        newsAccesButton.setTitle("", for: .normal)
        
    }
    
    internal func generate(articles: [Article]) {
        for i in 0...6 {
            newsTitle[i] = articles[i].title ?? ""
            newsDescription[i] = articles[i].description ?? ""
            newsPublishedAt[i] = articles[i].publishedAt ?? ""
            newsPhoto[i] = articles[i].urlToImage ?? ""
            newsContent[i] = articles[i].content ?? ""
            newsLink[i] = articles[i].url ?? ""
        }
    }
    
    @objc func slideToNext() {
        if currentCellIndex < newsTitle.count - 1 {
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
        cell.newsTitleLabel.text = newsTitle[indexPath.row]
        cell.newsFirstLineLabel.text = newsDescription[indexPath.row]
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedData = newsTitle[indexPath.item]
//        self.inputViewController?.performSegue(withIdentifier: "NewsDetailView", sender: selectedData)
//    //Para cuando seleccionas una celda, tienes el indexPath
//    }
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
    
    //Esto(IBAction del button y la prepare func) deberia estar en el MainViewController? Se que si está en él la funcion es override pero si debe estar ahí no existe newsTitle y aparte deberia volver a hacer llamada a api y eso no es viable(?)
    //Pero de esta manera no está haciendo nada el segue
    
    @IBAction func newsAccesActionButton(_ sender: UIButton) {
        print("THE NEWS ACCES ACTION BUTTON IS PRESSED")
        self.inputViewController?.performSegue(withIdentifier: "mySegue", sender: self)
        // self.performSegue(withIdentifier: "mySegue", sender: self)

    }
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            if let destination = segue.destination as? NewsDetailView {
                destination.titleLabel.text = newsTitle[0]// you can pass value to destination view controller
                print("HOLA") //Aqui no entra
            }
        }
    }
}
extension CarrouselCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 128)
    }
}

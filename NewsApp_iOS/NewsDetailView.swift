//
//  NewsDetailView.swift
//  NewsApp_iOS
//
//  Created by Irene on 9/8/22.
//

import Foundation
import UIKit
class NewsDetailView: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
   // var carrousel = CarrouselCell()
    
    override func viewDidLoad() {
       // print("AQUI \(carrousel.contador)")

        super.viewDidLoad()
        
//        if carrousel.contador == 0 {
//            titleLabel.text = carrousel.newsTitle[0]
//        }else if carrousel.currentCellIndex == 1{
//            titleLabel.text = carrousel.newsTitle[1]
//        }
    }



}


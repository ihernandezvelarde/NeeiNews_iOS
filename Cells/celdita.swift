//
//  celdita.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 13/7/22.
//

import UIKit

class celdita: UICollectionViewCell {
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsFirstLineLabel: UILabel!
    @IBOutlet weak var newsSecondLineLabel: UILabel!
    @IBOutlet weak var arrowRightButton: UIButton!
    @IBOutlet weak var arrowLeftButton: UIButton!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        if arrowLeftButton != nil && arrowRightButton != nil{
        arrowLeftButton.setImage(UIImage(named: "arrow.left.circle"), for: .normal)
        arrowRightButton.setImage(UIImage(named: "arrow.right.circle"), for: .normal)
        }
//        if newsTitleLabel != nil && newsFirstLineLabel != nil && newsSecondLineLabel != nil {
//        newsTitleLabel.font = UIFont(name: "Title 1", size: 25)
//        }
    }
}

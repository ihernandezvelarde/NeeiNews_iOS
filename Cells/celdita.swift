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
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
//        if newsTitleLabel != nil && newsFirstLineLabel != nil && newsSecondLineLabel != nil {
//        newsTitleLabel.font = UIFont(name: "Title 1", size: 25)
//        }
    }
}

//
//  InnerCell.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 13/7/22.
//

import UIKit

class InnerCell: UICollectionViewCell {
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsFirstLineLabel: UILabel!
    //@IBOutlet weak var newsSecondLineLabel: UILabel!
   
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func generate(article: Article) {
        newsTitleLabel.text = article.title
        newsFirstLineLabel.text = article.description
    }
}

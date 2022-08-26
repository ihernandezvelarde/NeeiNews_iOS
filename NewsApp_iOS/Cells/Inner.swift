//
//  Inner.swift
//  NewsApp_iOS
//
//  Created by Irene on 25/8/22.
//

import UIKit

class Inner: UICollectionViewCell,UICollectionViewDelegate {

    @IBOutlet weak var myfisrtLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    var cornerRadius: CGFloat = 25.0

    
    override func awakeFromNib() {
        contentView.layer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
    }
    
    func generate(article: Article) {
        myfisrtLabel.text = article.title
        mySecondLabel.text = article.description
       }

}

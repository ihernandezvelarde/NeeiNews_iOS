//
//  Inner.swift
//  NewsApp_iOS
//
//  Created by Irene on 25/8/22.
//

import UIKit

class Inner: UICollectionViewCell {
    
    @IBOutlet weak var myfisrtLabel: UILabel!

    @IBOutlet weak var mySecondLabel: UILabel!
    override func awakeFromNib() {
        myfisrtLabel.text = "HOLA"
        mySecondLabel.text = "ADIOS"
    }
}

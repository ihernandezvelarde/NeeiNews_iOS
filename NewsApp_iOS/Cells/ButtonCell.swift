//
//  ButtonCell.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 11/7/22.
//

import UIKit

class ButtonCell: UICollectionViewCell {
        
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var firstIcon: UIImageView!
    @IBOutlet weak var secondIcon: UIImageView!
    @IBOutlet weak var thirdIcon: UIImageView!
    
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    //    @IBOutlet weak var myFirstViewButton: UIView!
//    @IBOutlet weak var mySecondViewButton: UIView!
//    @IBOutlet weak var myThirdViewButton: UIView!
//    
// 
//    @IBOutlet weak var myFirstViewImage: UIImageView!
//    @IBOutlet weak var mySecondViewImage: UIImageView!
//    @IBOutlet weak var myThirdViewImage: UIImageView!
//    
//    @IBOutlet weak var firstViewLabel: UILabel!
//    @IBOutlet weak var secondViewLabel: UILabel!
//    @IBOutlet weak var thirdViewLabel: UILabel!
//    
//    
//    @IBOutlet weak var myFirstButton: UIButton!
//    @IBOutlet weak var mySecondButton: UIButton!
//    @IBOutlet weak var myThirdButton: UIButton!
    
    var config = ButtonCellConfig()
    var cornerRadius: CGFloat = 25.0
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        firstButton.setTitle("", for: .normal)
        secondButton.setTitle("", for: .normal)
        thirdButton.setTitle("", for: .normal)
        
        
        firstView.layer.shadowOffset = CGSize(width: config.shadowWidth,height: config.shadowHeight)
        firstView.layer.cornerRadius = config.cornerRadius
        firstView.layer.shadowOpacity = config.shadowOpacity
        firstView.layer.shadowRadius = config.shadowRadius
        
        secondView.layer.shadowOffset = CGSize(width: config.shadowWidth,height: config.shadowHeight)
        secondView.layer.cornerRadius = config.cornerRadius
        secondView.layer.shadowOpacity = config.shadowOpacity
        secondView.layer.shadowRadius = config.shadowRadius
        
        thirdView.layer.shadowOffset = CGSize(width: config.shadowWidth,height: config.shadowHeight)
        thirdView.layer.cornerRadius = config.cornerRadius
        thirdView.layer.shadowOpacity = config.shadowOpacity
        thirdView.layer.shadowRadius = config.shadowRadius
        
        firstLabel.text = "Trending"
        secondLabel.text = "Featured"
        thirdLabel.text = "Novelty"
    
    }
    @IBAction func clickFirstButton(_ sender: UIButton) {
        print("CLICK BUTTON 1")
    }
    
    
    @IBAction func clickSecondButton(_ sender: UIButton) {
        print("CLICK BUTTON 2")
    }
    
    @IBAction func clickThirdButton(_ sender: UIButton) {
        print("CLICK BUTTON 3")
    }
    
}

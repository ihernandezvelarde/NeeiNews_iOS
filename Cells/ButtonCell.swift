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
    
    @IBOutlet weak var firstViewImage: UIImageView!
    @IBOutlet weak var secondViewImage: UIImageView!
    @IBOutlet weak var thirdViewImage: UIImageView!
    
    @IBOutlet weak var firstViewLabel: UILabel!
    @IBOutlet weak var secondViewLabel: UILabel!
    @IBOutlet weak var thirdViewLabel: UILabel!
    
    @IBOutlet weak var firstViewButton: UIButton!
    @IBOutlet weak var secondViewButton: UIButton!
    @IBOutlet weak var thirdViewButton: UIButton!
    
    var config = ButtonCellConfig()
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        if firstViewButton != nil && secondViewButton != nil && thirdViewButton != nil {
            firstViewButton.setTitle("", for: .normal)
            secondViewButton.setTitle("", for: .normal)
            thirdViewButton.setTitle("", for: .normal)
        }
        if firstViewImage != nil && secondViewImage != nil && thirdViewImage != nil {
            firstViewImage.image = UIImage(named: config.square)?.withRenderingMode(.alwaysTemplate)
            firstViewImage.tintColor = UIColor.red
                
            secondViewImage.image = UIImage(named: config.square)?.withRenderingMode(.alwaysTemplate)
            secondViewImage.tintColor = UIColor.red
                
            thirdViewImage.image = UIImage(named: config.square)?.withRenderingMode(.alwaysTemplate)
            thirdViewImage.tintColor = UIColor.red
        }
        
        if firstView != nil && secondView != nil && thirdView != nil {
            firstView.layer.cornerRadius = config.cornerRadius
            secondView.layer.cornerRadius = config.cornerRadius
            thirdView.layer.cornerRadius = config.cornerRadius
            
            firstView.layer.shadowOffset = CGSize(width: config.shadowWidth,height: config.shadowHeight)
            firstView.layer.shadowOpacity = config.shadowOpacity
            firstView.layer.shadowRadius = config.shadowRadius
            
            secondView.layer.shadowOffset = CGSize(width: config.shadowWidth,height: config.shadowHeight)
            secondView.layer.shadowOpacity = config.shadowOpacity
            secondView.layer.shadowRadius = config.shadowRadius
        
            thirdView.layer.shadowOffset = CGSize(width: config.shadowWidth,height: config.shadowHeight)
            thirdView.layer.shadowOpacity = config.shadowOpacity
            thirdView.layer.shadowRadius = config.shadowRadius

        } else {
            print("Doesn’t contain a value.")
        }
    }

    @IBAction func firstButtonIsPressed(_ sender: UIButton!) {
        print("FIRST BUTTON IS PRESSED!")
    }
    
    @IBAction func secondButtonIsPressed(_ sender: UIButton!) {
        print("SECOND BUTTON IS PRESSED!")
    }
    
    @IBAction func thirdButtonIsPressed(_ sender: UIButton!) {
        print("THIRD BUTTON IS PRESSED!")
    }
    
}

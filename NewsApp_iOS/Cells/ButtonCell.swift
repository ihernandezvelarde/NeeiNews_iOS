//
//  ButtonCell.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 11/7/22.
//

import UIKit

class ButtonCell: UICollectionViewCell {
        
    
    @IBOutlet weak var myFirstViewButton: UIView!
    @IBOutlet weak var mySecondViewButton: UIView!
    @IBOutlet weak var myThirdViewButton: UIView!
    
 
    @IBOutlet weak var myFirstViewImage: UIImageView!
    @IBOutlet weak var mySecondViewImage: UIImageView!
    @IBOutlet weak var myThirdViewImage: UIImageView!
    
    @IBOutlet weak var firstViewLabel: UILabel!
    @IBOutlet weak var secondViewLabel: UILabel!
    @IBOutlet weak var thirdViewLabel: UILabel!
    
    
    @IBOutlet weak var myFirstButton: UIButton!
    @IBOutlet weak var mySecondButton: UIButton!
    @IBOutlet weak var myThirdButton: UIButton!
    
    var config = ButtonCellConfig()
    var cornerRadius: CGFloat = 25.0
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        if myFirstViewButton != nil && mySecondViewButton != nil && myThirdViewButton != nil {
            myFirstButton.setTitle("", for: .normal)
            mySecondButton.setTitle("", for: .normal)
            myThirdButton.setTitle("", for: .normal)
        }
        if myFirstViewImage != nil && mySecondViewImage != nil && myThirdViewImage != nil {
            myFirstViewImage.image = UIImage(named: config.square)?.withRenderingMode(.alwaysTemplate)
            myFirstViewImage.tintColor = UIColor.purple
                
            mySecondViewImage.image = UIImage(named: config.square)?.withRenderingMode(.alwaysTemplate)
            mySecondViewImage.tintColor = UIColor.purple
                
            myThirdViewImage.image = UIImage(named: config.square)?.withRenderingMode(.alwaysTemplate)
            myThirdViewImage.tintColor = UIColor.purple
        }
        
        if myFirstViewButton != nil && mySecondViewButton != nil && myThirdViewButton != nil {
            myFirstViewButton.layer.cornerRadius = config.cornerRadius
            mySecondViewButton.layer.cornerRadius = config.cornerRadius
            myThirdViewButton.layer.cornerRadius = config.cornerRadius
            
            myFirstViewButton.layer.shadowOffset = CGSize(width: config.shadowWidth,height: config.shadowHeight)
            myFirstViewButton.layer.shadowOpacity = config.shadowOpacity
            myFirstViewButton.layer.shadowRadius = config.shadowRadius
            
            mySecondViewButton.layer.shadowOffset = CGSize(width: config.shadowWidth,height: config.shadowHeight)
            mySecondViewButton.layer.shadowOpacity = config.shadowOpacity
            mySecondViewButton.layer.shadowRadius = config.shadowRadius
        
            myThirdViewButton.layer.shadowOffset = CGSize(width: config.shadowWidth,height: config.shadowHeight)
            myThirdViewButton.layer.shadowOpacity = config.shadowOpacity
            myThirdViewButton.layer.shadowRadius = config.shadowRadius

        } else {
            print("Doesn’t contain a value.")
        }
    }

    @IBAction func myFirstButtonIsPressed(_ sender: UIButton) {
        print("PRESIONADOOOO PRIMERO")
    }
    
    @IBAction func mySecondButtonIsPressed(_ sender: UIButton) {
        print("PRESIONADOOOO SEGUNDO")

    }
    
    @IBAction func myThirdButtonIsPressed(_ sender: UIButton) {
        print("PRESIONADOOOO TERCERO")

    }
    
}

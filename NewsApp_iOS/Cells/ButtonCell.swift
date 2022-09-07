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
    

    var config = ButtonCellConfig()
    var cornerRadius: CGFloat = 25.0
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        firstButton.setTitle("", for: .normal)
        secondButton.setTitle("", for: .normal)
        thirdButton.setTitle("", for: .normal)
        
        firstIcon.image = UIImage(named: "trending-topic")
        secondIcon.image = UIImage(named: "favorite")
        thirdIcon.image = UIImage(named: "new")
        
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
        let controller = UIAlertController(title: "En desarrollo", message: "Estamos trabajando en ello, gracias!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(ok)
        self.window?.rootViewController?.present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func clickSecondButton(_ sender: UIButton) {
        let controller = UIAlertController(title: "En desarrollo", message: "Estamos trabajando en ello, gracias!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(ok)
        self.window?.rootViewController?.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func clickThirdButton(_ sender: UIButton) {
        let controller = UIAlertController(title: "En desarrollo", message: "Estamos trabajando en ello, gracias!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(ok)
        self.window?.rootViewController?.present(controller, animated: true, completion: nil)
    }
    
}

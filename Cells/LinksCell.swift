//
//  LinksCell.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 11/7/22.
//

import UIKit

class LinksCell: UICollectionViewCell {
    
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    var config = LinkCellConfig()
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        facebookButton.imageView?.contentMode = .scaleAspectFill
        facebookButton.frame = CGRect(x: config.buttonSize, y: config.buttonSize, width: config.buttonSize, height: config.buttonSize)
        facebookButton.setTitle("", for: .normal)
        facebookButton.setImage(UIImage(named: config.facebookImage), for: .normal)
        instagramButton.setTitle("", for: .normal)
        instagramButton.setImage(UIImage(named: config.instagramImage), for: .normal)
        youtubeButton.setTitle("", for: .normal)
        youtubeButton.setImage(UIImage(named: config.youtubeImage), for: .normal)
    }
  
    @IBAction func facebookURL(_ sender: UIButton!) {
        if let url = URL(string: config.facebookURL) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("ERROR LOG: LinksCell button facebookURL launch failed: safe link not found")
            }
    }
    
    @IBAction func instagramURL(_ sender: UIButton!) {
        if let url = URL(string: config.instagramURL) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("ERROR LOG: LinksCell button instagramURL launch failed: safe link not found")
            }
        }
    
    @IBAction func youtubeURL(_ sender: UIButton!) {
        if let url = URL(string: config.youtubeURL) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("ERROR LOG: LinksCell button youtubeURL launch failed: safe link not found")
            }
    }
}

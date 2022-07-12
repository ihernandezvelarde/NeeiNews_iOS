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
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        facebookButton.imageView?.contentMode = .scaleAspectFill
        facebookButton.frame = CGRect(x: 20, y: 20, width: 20, height: 20)
        facebookButton.setTitle("", for: .normal)
        facebookButton.setImage(UIImage(named: "facebook"), for: .normal)
        instagramButton.setTitle("", for: .normal)
        instagramButton.setImage(UIImage(named: "instagram"), for: .normal)
        youtubeButton.setTitle("", for: .normal)
        youtubeButton.setImage((UIImage(named: "youtube")), for: .normal)
    }
  
    @IBAction func facebookURL(_ sender: UIButton) {
        if let url = URL(string: "https://es-es.facebook.com/") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("ERROR LOG: LinksCell button facebookURL launch failed: safe link not found")
            }
    }
    
    @IBAction func instagramURL(_ sender: UIButton) {
        if let url = URL(string: "https://www.instagram.com/") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("ERROR LOG: LinksCell button instagramURL launch failed: safe link not found")
            }
        }
    
    @IBAction func youtubeURL(_ sender: UIButton) {
        if let url = URL(string: "https://www.youtube.com/") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("ERROR LOG: LinksCell button youtubeURL launch failed: safe link not found")
            }
    }
}

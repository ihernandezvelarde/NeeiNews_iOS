//
//  ViewController.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 6/7/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let launchImage = UIImageView(image: UIImage(named: "news_icon")!)
    let splashView = UIView()
         
    @IBOutlet weak var simpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashView.backgroundColor = UIColor(red: 209/255, green: 209/255, blue: 214/255, alpha: 1.0)
        view.addSubview(splashView)
        launchImage.contentMode = .scaleAspectFit
        splashView.addSubview(launchImage)
        splashView.removeFromSuperview()

        // FIXME: -- Change background color when design it's done.
        simpleView.backgroundColor = .green
        

    }
}

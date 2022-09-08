//
//  OptionsViewController.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 13/7/22.
//


import UIKit

class OptionsViewController: UIViewController {
    
    @IBOutlet weak var tileLabel: UILabel!
    @IBOutlet weak var choseYourLanguajeLabel: UILabel!
    
    @IBOutlet weak var argentinianButton: UIButton!
    @IBOutlet weak var argentinianLabel: UILabel!
    
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var englishLabel: UILabel!
    
    @IBOutlet weak var japaneseButton: UIButton!
    @IBOutlet weak var japaneseLabel: UILabel!
    
    @IBOutlet weak var italianButton: UIButton!
    @IBOutlet weak var italianLabel: UILabel!
    
    @IBOutlet weak var sobreLaAppButton: UIButton!
    @IBOutlet weak var permisosButton: UIButton!
    
    @IBOutlet var myview: UIView!
    var config = OptionsConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tileLabel.text = "LANGUAGE"
        
        choseYourLanguajeLabel.text = "Chose your language."
        argentinianLabel.text = "Argentinian"
        englishLabel.text = "English"
        japaneseLabel.text = "Japanese"
        italianLabel.text = "Italian"
        
        argentinianButton.setTitle("", for: .normal)
        englishButton.setTitle("", for: .normal)
        japaneseButton.setTitle("", for: .normal)
        italianButton.setTitle("", for: .normal)
        
        argentinianButton.setImage(UIImage (named: "AR"), for: .normal)
        englishButton.setImage(UIImage (named: "US"), for: .normal)
        japaneseButton.setImage(UIImage (named: "JP"), for: .normal)
        italianButton.setImage(UIImage (named: "IT"), for: .normal)
        
        sobreLaAppButton.configuration?.cornerStyle = .capsule
        sobreLaAppButton.setTitle(config.sobreLaApp, for: .normal)
        sobreLaAppButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        sobreLaAppButton.setTitleColor(UIColor.black, for: .normal)
        
        permisosButton.configuration?.cornerStyle = .capsule
        permisosButton.setTitle(config.permisos, for: .normal)
        permisosButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        permisosButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    
    @IBAction func argentinianButtonPressed(_ sender: UIButton) {
        print("ARGENTINIAN BUTTON IS PRESSED!")
    }

    @IBAction func englishButtonPressed(_ sender: UIButton) {
        print("ENGLISH BUTTON IS PRESSED!")
    }
    
    @IBAction func japaneseButtonPressed(_ sender: UIButton) {
        print("JAPANESE BUTTON IS PRESSED!")
    }
    
    @IBAction func italianButtonPressed(_ sender: UIButton) {
        print("ITALIAN BUTTON IS PRESSED!")
    }
    
    @IBAction func sobreLaAppButtonPressed(_ sender: UIButton) {
        print("ABOUT APP BUTTON IS PRESSED!")
    }
    
    @IBAction func permisosButtonPressed(_ sender: UIButton) {
        print("PERMISSIONS BUTTON IS PRESSED!")
    }
}

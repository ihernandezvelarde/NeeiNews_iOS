//
//  OptionsViewController.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 13/7/22.
//


import UIKit

class OptionsViewController: UIViewController{
    
    @IBOutlet weak var lenguageLabel: UILabel!
    
    @IBOutlet weak var castellanoLabel: UILabel!
    @IBOutlet weak var catalanLabel: UILabel!
    @IBOutlet weak var inglesLabel: UILabel!
    
    @IBOutlet weak var castellanoButton: UIButton!
    @IBOutlet weak var catalanButton: UIButton!
    @IBOutlet weak var inglesButton: UIButton!
    
    
    
    @IBOutlet var myview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myview.backgroundColor = .darkGray
        
        lenguageLabel.text = "LENGUAGE"
        lenguageLabel.textColor = .white
        lenguageLabel.font = UIFont(name: "Copperplate-Bold", size: 25)
        
        castellanoButton.setTitle("", for: .normal)
        catalanButton.setTitle("", for: .normal)
        inglesButton.setTitle("", for: .normal)
        
        castellanoButton.setImage(UIImage(named: "radio-button"), for: .normal)
        catalanButton.setImage(UIImage(named: "radio-button"), for: .normal)
        inglesButton.setImage(UIImage(named: "radio-button"), for: .normal)
        
        
        castellanoLabel.text = "Castellano"
        catalanLabel.text = "Catalán"
        inglesLabel.text = "Inglés"
    }
    
    @IBAction func castellanoButtonPressed(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            catalanButton.isSelected = false
            inglesButton.isSelected = false
        } else {
            sender.isSelected = true
            catalanButton.isSelected = false
            inglesButton.isSelected = false
        }
    }
    
    
    @IBAction func catalanButtonPressed(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            castellanoButton.isSelected = false
            inglesButton.isSelected = false
        } else {
            sender.isSelected = true
            castellanoButton.isSelected = false
            inglesButton.isSelected = false
        }
    }
    
    
    @IBAction func inglesButtonPressed(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            catalanButton.isSelected = false
            castellanoButton.isSelected = false
        } else {
            sender.isSelected = true
            catalanButton.isSelected = false
            castellanoButton.isSelected = false
        }
    }
}

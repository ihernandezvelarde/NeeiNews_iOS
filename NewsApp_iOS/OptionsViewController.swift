//
//  OptionsViewController.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 13/7/22.
//


import UIKit

class OptionsViewController: UIViewController {
    
    @IBOutlet weak var lenguageLabel: UILabel!
    
    @IBOutlet weak var castellanoLabel: UILabel!
    @IBOutlet weak var catalanLabel: UILabel!
    @IBOutlet weak var inglesLabel: UILabel!
    
    @IBOutlet weak var castellanoButton: UIButton!
    @IBOutlet weak var catalanButton: UIButton!
    @IBOutlet weak var inglesButton: UIButton!
    
    @IBOutlet weak var sobreLaAppButton: UIButton!
    @IBOutlet weak var permisosButton: UIButton!
    
    @IBOutlet var myview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myview.backgroundColor = .darkGray
        lenguageLabel.text = "LENGUAGE"
        lenguageLabel.textColor = .white
        lenguageLabel.font = UIFont(name: "Copperplate-Bold", size: 25)
        
        sobreLaAppButton.setTitle("Sobre la app", for: .normal)
        sobreLaAppButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        sobreLaAppButton.backgroundColor = .white
        sobreLaAppButton.layer.cornerRadius = 7
        sobreLaAppButton.setTitleColor(UIColor.black, for: .normal)
        
        permisosButton.setTitle("Permisos", for: .normal)
        permisosButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        permisosButton.backgroundColor = .white
        permisosButton.layer.cornerRadius = 7
        permisosButton.setTitleColor(UIColor.black, for: .normal)
        
        castellanoButton.setTitle("", for: .normal)
        catalanButton.setTitle("", for: .normal)
        inglesButton.setTitle("", for: .normal)
        
        castellanoButton.setImage(UIImage(named: "radio-button"), for: .normal)
        catalanButton.setImage(UIImage(named: "radio-button"), for: .normal)
        inglesButton.setImage(UIImage(named: "radio-button"), for: .normal)
        
        
        castellanoLabel.text = "Castellano"
        castellanoLabel.textColor = .white
        
        catalanLabel.text = "Catalán"
        catalanLabel.textColor = .white
        
        inglesLabel.text = "Inglés"
        inglesLabel.textColor = .white
    }
    
    @IBAction func castellanoButtonPressed(_ sender: UIButton) {
        if sender.isSelected{
            
            sender.isSelected = false
            catalanButton.isSelected = false
            inglesButton.isSelected = false
            
        } else {
            inglesButton.setImage(UIImage(named: "radio-button"), for: .normal)
            catalanButton.setImage(UIImage(named: "radio-button"), for: .normal)
            castellanoButton.setImage(UIImage(named: "radio-on-button"), for: .normal)
            sender.isSelected = true
            catalanButton.isSelected = false
            inglesButton.isSelected = false
            print("CASTELLANO RADIO BUTTON IS SELECTED")
        }
        sender.isSelected = false
    }
    
    
    @IBAction func catalanButtonPressed(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            castellanoButton.isSelected = false
            inglesButton.isSelected = false
        } else {
            inglesButton.setImage(UIImage(named: "radio-button"), for: .normal)
            catalanButton.setImage(UIImage(named: "radio-on-button"), for: .normal)
            castellanoButton.setImage(UIImage(named: "radio-button"), for: .normal)
            sender.isSelected = true
            castellanoButton.isSelected = false
            inglesButton.isSelected = false
            print("CATALAN RADIO BUTTON IS SELECTED")
        }
        sender.isSelected = false
    }
    
    
    @IBAction func inglesButtonPressed(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            catalanButton.isSelected = false
            castellanoButton.isSelected = false
        } else {
            inglesButton.setImage(UIImage(named: "radio-on-button"), for: .normal)
            catalanButton.setImage(UIImage(named: "radio-button"), for: .normal)
            castellanoButton.setImage(UIImage(named: "radio-button"), for: .normal)
            sender.isSelected = true
            catalanButton.isSelected = false
            castellanoButton.isSelected = false
            print("INGLÉS RADIO BUTTON IS SELECTED")
        }
        sender.isSelected = false
    }
    
    
    @IBAction func sobreLaAppButtonPressed(_ sender: UIButton) {
        print("SOBRE LA APP BUTTON IS PRESSED!")
    }
    
    
    @IBAction func permisosButtonPressed(_ sender: UIButton) {
        print("PERMISOS BUTTON IS PRESSED!")
    }
}

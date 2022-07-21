//
//  TimeLineViewController.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 19/7/22.
//

import Foundation
import UIKit
class TimeLineViewController: UIViewController{

    @IBOutlet weak var firsNewLabel: UILabel!
    @IBOutlet weak var secondNewLabel: UILabel!
    @IBOutlet weak var thirdNewLabel: UILabel!
    @IBOutlet weak var forthNewLabel: UILabel!
    @IBOutlet weak var fiveNewLabel: UILabel!
    @IBOutlet weak var sixNewLabel: UILabel!
    
    
    @IBOutlet weak var firstNewImage: UIImageView!
    
    @IBOutlet weak var firstPartNextNewOneImage: UIImageView!
    @IBOutlet weak var secondPartNextNewTwoImage: UIImageView!
    
    @IBOutlet weak var secondNewImage: UIImageView!
    
    @IBOutlet weak var firstPartNextNewThreeImage: UIImageView!
    @IBOutlet weak var secondPartNextNewFourImage: UIImageView!
    
    @IBOutlet weak var thirdNewImage: UIImageView!
    
    @IBOutlet weak var firstPartNextNewFiveImage: UIImageView!
    @IBOutlet weak var secondPartNextNewSixImage: UIImageView!
    
    @IBOutlet weak var fourthNewImage: UIImageView!
    
    @IBOutlet weak var firstPartNextNewSevenImage: UIImageView!
    @IBOutlet weak var secondPartNextNewEigthImage: UIImageView!
    
    @IBOutlet weak var fiveNewImage: UIImageView!
    
    @IBOutlet weak var firstPartNextNewNineImage: UIImageView!
    @IBOutlet weak var secondPartNextNewTenImage: UIImageView!
    
    @IBOutlet weak var sixNewImage: UIImageView!
    
    var timer : Timer?
    var prueba = "10:0:0"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNewImage.image = UIImage(named: "radio-button")
        secondNewImage.image = UIImage(named: "radio-button")
        thirdNewImage.image = UIImage(named: "radio-button")
        fourthNewImage.image = UIImage(named: "radio-button")
        fiveNewImage.image = UIImage(named: "radio-button")
        sixNewImage.image = UIImage(named: "radio-button")
        
        firstPartNextNewOneImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        firstPartNextNewOneImage.tintColor = .black
        
        secondPartNextNewTwoImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        secondPartNextNewTwoImage.tintColor = .black
        
        firstPartNextNewThreeImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        firstPartNextNewThreeImage.tintColor = .black
        
        secondPartNextNewFourImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        secondPartNextNewFourImage.tintColor = .black

        firstPartNextNewFiveImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        firstPartNextNewFiveImage.tintColor = .black

        secondPartNextNewSixImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        secondPartNextNewSixImage.tintColor = .black

        firstPartNextNewSevenImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        firstPartNextNewSevenImage.tintColor = .black

        secondPartNextNewEigthImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        secondPartNextNewEigthImage.tintColor = .black

        firstPartNextNewNineImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        firstPartNextNewNineImage.tintColor = .black

        secondPartNextNewTenImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        secondPartNextNewTenImage.tintColor = .black

        
        firsNewLabel.text = "8:00 - Esta es la primera noticia. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nunc convallis."
        secondNewLabel.text = "9:00 - Esta es la segunda noticia. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nunc convallis."
        thirdNewLabel.text = "9:15 - Esta es la tercera noticia. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nunc convallis."
        forthNewLabel.text = "9:45 - Esta es la cuarta noticia. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nunc convallis."
        fiveNewLabel.text = "10:30 - Esta es la quinta noticia. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nunc convallis."
        sixNewLabel.text = "12:00 - Esta es la sexta noticia. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nunc convallis."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(checkTime), userInfo: nil, repeats: true)
    }
    @objc func checkTime(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        print("hours = \(hour):\(minutes):\(seconds)")
        let hours = ("\(hour):\(minutes):\(seconds)")
        
        if hours >= "8:0:0" {
            firstNewImage.image = UIImage(named: "radio-on-button")
            firstNewImage.tintColor = .red
        }
        if hours >= "8:25:0" {
            firstPartNextNewOneImage.tintColor = .red
        }
        if hours >= "8:45:0" {
            secondPartNextNewTwoImage.tintColor = .red
        }
        if hours >= "9:0:0" {
            secondNewImage.image = UIImage(named: "radio-on-button")
            secondNewImage.tintColor = .red
        }
        if hours >= "9:05:0" {
            firstPartNextNewThreeImage.tintColor = .red
        }
        if hours >= "9:10:0" {
            secondPartNextNewFourImage.tintColor = .red
        }
        if hours >= "9:15:0" {
            thirdNewImage.image = UIImage(named: "radio-on-button")
            thirdNewImage.tintColor = .red
        }
        if hours >= "9:25:0" {
            firstPartNextNewFiveImage.tintColor = .red
        }
        if hours >= "9:35:0" {
            secondPartNextNewSixImage.tintColor = .red
        }
        if hours >= "9:45:0" {
            fourthNewImage.image = UIImage(named: "radio-on-button")
            fourthNewImage.tintColor = .red
        }
        if hours >= "10:0:0" {
            firstPartNextNewSevenImage.tintColor = .red
        }
        if hours >= "10:25:0" {
            secondPartNextNewEigthImage.tintColor = .red
        }
        if hours >= "10:30:0" {
            fiveNewImage.image = UIImage(named: "radio-on-button")
            fiveNewImage.tintColor = .red
        }
        if hours >= "11:0:0" {
            firstPartNextNewNineImage.tintColor = UIColor.red
        }
        if hours >= "11:30:0" {
            secondPartNextNewTenImage.tintColor = UIColor.red
        }
        if hours >= "12:0:0" {
            sixNewImage.image = UIImage(named: "radio-on-button")
        }
    }
}


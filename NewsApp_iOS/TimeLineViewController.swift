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
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNewImage.image = UIImage(named: "radio-button")
        secondNewImage.image = UIImage(named: "radio-button")
        thirdNewImage.image = UIImage(named: "radio-button")
        fourthNewImage.image = UIImage(named: "radio-button")
        fiveNewImage.image = UIImage(named: "radio-button")
        sixNewImage.image = UIImage(named: "radio-button")
        
        firstPartNextNewOneImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        secondPartNextNewTwoImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        firstPartNextNewThreeImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        secondPartNextNewFourImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        firstPartNextNewFiveImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        secondPartNextNewSixImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        firstPartNextNewSevenImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        secondPartNextNewEigthImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        firstPartNextNewNineImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
        secondPartNextNewTenImage.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate);
       
        
        firsNewLabel.text = "8:00 - Esta es la primera noticia. Bla bla bla bla bla, bla bla bla bla bla, blablabla blabla bla bla bla."
        secondNewLabel.text = "9:00 - Esta es la segunda noticia. Bla bla bla bla bla, bla bla bla bla bla, blablabla blabla bla bla bla."
        thirdNewLabel.text = "9:15 - Esta es la tercera noticia. Bla bla bla bla bla, bla bla bla bla bla, blablabla blabla bla bla bla."
        forthNewLabel.text = "9:45 - Esta es la cuarta noticia. Bla bla bla bla bla, bla bla bla bla bla, blablabla blabla bla bla bla."
        fiveNewLabel.text = "10:30 - Esta es la quinta noticia. Bla bla bla bla bla, bla bla bla bla bla, blablabla blabla bla bla bla."
        sixNewLabel.text = "12:00 - Esta es la sexta noticia. Bla bla bla bla bla, bla bla bla bla bla, blablabla blabla bla bla bla."
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

        if hours >= "8:0:00"{
            firstNewImage.image = UIImage(named: "radio-on-button")
            firstNewImage.tintColor = .red
        }
        if hours >= "8:25:00"{
            firstPartNextNewOneImage.tintColor = .red
        }
        if hours >= "8:45:00"{
            secondPartNextNewTwoImage.tintColor = .red
        }
        if hours >= "9:0:00"{
            secondNewImage.image = UIImage(named: "radio-on-button")
            secondNewImage.tintColor = .red
        }
        if hours >= "9:5:00"{
            firstPartNextNewThreeImage.tintColor = .red
        }
        if hours >= "9:10:00"{
            secondPartNextNewFourImage.tintColor = .red
        }
        if hours >= "9:15:00"{
            thirdNewImage.image = UIImage(named: "radio-on-button")
            thirdNewImage.tintColor = .red
        }
        if hours >= "9:25:00"{
            firstPartNextNewFiveImage.tintColor = .red
        }
        if hours >= "9:35:00"{
            secondPartNextNewSixImage.tintColor = .red
        }
        if hours >= "9:45:00"{
            fourthNewImage.image = UIImage(named: "radio-on-button")
            fourthNewImage.tintColor = .red
        }
        if hours >= "10:0:00"{
            firstPartNextNewSevenImage.tintColor = .red
        }
        if hours >= "10:15:00"{
            secondPartNextNewEigthImage.tintColor = .red
        }
        if hours >= "10:30:00"{
            fiveNewImage.image = UIImage(named: "radio-on-button")
            fiveNewImage.tintColor = .red
        }
        if hours >= "11:0:00"{
            firstPartNextNewNineImage.tintColor = UIColor.red
        }
        if hours >= "11:30:00"{
            secondPartNextNewTenImage.tintColor = UIColor.red
        }
        if hours >= "12:0:00"{
            sixNewImage.image = UIImage(named: "radio-on-button")
        }
    }
}


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
    var config = TimeLineConfig()
    var timer : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNewImage.image = UIImage(named: config.radioButton)
        secondNewImage.image = UIImage(named: config.radioButton)
        thirdNewImage.image = UIImage(named: config.radioButton)
        fourthNewImage.image = UIImage(named: config.radioButton)
        fiveNewImage.image = UIImage(named: config.radioButton)
        sixNewImage.image = UIImage(named: config.radioButton)
        
        firstPartNextNewOneImage.image = UIImage(named: config.line)?.withRenderingMode(.alwaysTemplate)
        firstPartNextNewOneImage.tintColor = .black
        
        secondPartNextNewTwoImage.image = UIImage(named: config.line)?.withRenderingMode(.alwaysTemplate)
        secondPartNextNewTwoImage.tintColor = .black
        
        firstPartNextNewThreeImage.image = UIImage(named: config.line)?.withRenderingMode(.alwaysTemplate)
        firstPartNextNewThreeImage.tintColor = .black
        
        secondPartNextNewFourImage.image = UIImage(named: config.line)?.withRenderingMode(.alwaysTemplate)
        secondPartNextNewFourImage.tintColor = .black

        firstPartNextNewFiveImage.image = UIImage(named: config.line)?.withRenderingMode(.alwaysTemplate)
        firstPartNextNewFiveImage.tintColor = .black

        secondPartNextNewSixImage.image = UIImage(named: config.line)?.withRenderingMode(.alwaysTemplate)
        secondPartNextNewSixImage.tintColor = .black

        firstPartNextNewSevenImage.image = UIImage(named: config.line)?.withRenderingMode(.alwaysTemplate)
        firstPartNextNewSevenImage.tintColor = .black

        secondPartNextNewEigthImage.image = UIImage(named: config.line)?.withRenderingMode(.alwaysTemplate)
        secondPartNextNewEigthImage.tintColor = .black

        firstPartNextNewNineImage.image = UIImage(named: config.line)?.withRenderingMode(.alwaysTemplate)
        firstPartNextNewNineImage.tintColor = .black

        secondPartNextNewTenImage.image = UIImage(named: config.line)?.withRenderingMode(.alwaysTemplate)
        secondPartNextNewTenImage.tintColor = .black

        
        firsNewLabel.text = config.hourEightAM + " - Morning news. National and international themes. Society, culture and economy."
        secondNewLabel.text = config.hourNineAM + " - Weather information. Know today's and the rest of the week weather."
        thirdNewLabel.text = config.hourNineFifteen + " - Breaking news information about the most popular sports."
        forthNewLabel.text = config.hourNineFourtyFive + " - Informative about the most watched series and movies on Netflix and Disney plus."
        fiveNewLabel.text = config.hourTenThirty + " - Informative about the new games that are going to come out for different platforms."
        sixNewLabel.text = config.hourTwelve + " - Local news. Current affairs on society, culture and economy."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(checkTime), userInfo: nil, repeats: true)
    }
    @objc func checkTime(){
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
    
        let hours = ("\(hour):\(minutes):\(seconds)")
        
        if hours.compare(config.hourEightAM, options: .numeric) == .orderedDescending {
            firstNewImage.image = UIImage(named: config.redRadioButton)
            firstNewImage.tintColor = .red
        }
        if hours.compare(config.hourEightTwentyFive, options: .numeric) == .orderedDescending {
            firstPartNextNewOneImage.tintColor = .red
        }
        if hours.compare(config.hourEightFourtyFive, options: .numeric) == .orderedDescending {
            secondPartNextNewTwoImage.tintColor = .red
        }
        if hours.compare(config.hourNineAM, options: .numeric) == .orderedDescending {
            secondNewImage.image = UIImage(named: config.redRadioButton)
            secondNewImage.tintColor = .red
        }
        if hours.compare(config.hourNineFive, options: .numeric) == .orderedDescending {
            firstPartNextNewThreeImage.tintColor = .red
        }
        if hours.compare(config.hourNineTen, options: .numeric) == .orderedDescending {
            secondPartNextNewFourImage.tintColor = .red
        }
        if hours.compare(config.hourNineFifteen, options: .numeric) == .orderedDescending {
            thirdNewImage.image = UIImage(named: config.redRadioButton)
            thirdNewImage.tintColor = .red
        }
        if hours.compare(config.hourNineTwentyFive, options: .numeric) == .orderedDescending {
            firstPartNextNewFiveImage.tintColor = .red
        }
        if hours.compare(config.hourNineThirtyFive, options: .numeric) == .orderedDescending {
            secondPartNextNewSixImage.tintColor = .red
        }
        if hours.compare(config.hourNineFourtyFive, options: .numeric) == .orderedDescending {
            fourthNewImage.image = UIImage(named: config.redRadioButton)
            fourthNewImage.tintColor = .red
        }
        if hours.compare(config.hourTen, options: .numeric) == .orderedDescending {
            firstPartNextNewSevenImage.tintColor = .red
        }
        if hours.compare(config.hourTenFifteen, options: .numeric) == .orderedDescending {
            secondPartNextNewEigthImage.tintColor = .red
        }
        if hours.compare(config.hourTenThirty, options: .numeric) == .orderedDescending {
            fiveNewImage.image = UIImage(named: config.redRadioButton)
            fiveNewImage.tintColor = .red
        }
        if hours.compare(config.hourEleven, options: .numeric) == .orderedDescending {
            firstPartNextNewNineImage.tintColor = UIColor.red
        }
        if hours.compare(config.hourElevenThirty, options: .numeric) == .orderedDescending {
            secondPartNextNewTenImage.tintColor = UIColor.red
        }
        if hours.compare(config.hourTwelve, options: .numeric) == .orderedDescending {
            sixNewImage.image = UIImage(named: config.redRadioButton)
        }
    }
}


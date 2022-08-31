//
//  ViewController.swift
//  NewsApp_iOS
//
//  Created by Irene Hernández on 6/7/22.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var newsAppTitleLabel: UILabel!
    
    @IBOutlet weak var intHourLabel: UILabel!
    @IBOutlet weak var textHourLabel: UILabel!
    
    @IBOutlet weak var intMinuteLabel: UILabel!
    @IBOutlet weak var textMinuteLabel: UILabel!
    
    @IBOutlet weak var intSecondLabel: UILabel!
    @IBOutlet weak var textSecondLabel: UILabel!
    
    
    @IBOutlet weak var intNewsCounterLabel: UILabel!
    @IBOutlet weak var textNewsCounterLabel: UILabel!
    
    @IBOutlet weak var intUsersCounterLabel: UILabel!
    @IBOutlet weak var textUsersCounterLabel: UILabel!
    
    @IBOutlet weak var iconMoreInfoLabel: UILabel!
    @IBOutlet weak var textMoreInfoLabel: UILabel!
    
    
    
    @IBOutlet weak var fakeButtonLeft: UIView!
    @IBOutlet weak var fakeButtonCenter: UIView!
    @IBOutlet weak var fakeButtonRight: UIView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var simpleView: UIView!
    var timer : Timer?
    var config = MainConfig()
    let launchImage = UIImageView(image: UIImage(named: "news_icon")!)
    let splashView = UIView()
    let counterArticles = Article()
    override func viewDidAppear(_ animated: Bool) {
        if Reachability.isConnectedToNetwork() == true {
            print("Connected")
        }else {
            let controller = UIAlertController(title: "No Internet Detected", message: "This app requires an Internet connection", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(ok)
            present(controller, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRight = UITapGestureRecognizer(target: self, action: #selector(clickRight))
        fakeButtonRight.isUserInteractionEnabled = true
        fakeButtonRight.addGestureRecognizer(gestureRight)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(checkTime), userInfo: nil, repeats: true)
        
        let contadorUsers = 32*8
        let contador = ((counterArticles.title?.count ?? 20))*18
        newsAppTitleLabel.text = "#NEWS"
        textHourLabel.text = "HOURS"
        textMinuteLabel.text = "MINUTES"
        textSecondLabel.text = "SECONDS"
        textNewsCounterLabel.text = "NEWS"
        textUsersCounterLabel.text = "USERS"
        textMoreInfoLabel.text = "INFO"
        intNewsCounterLabel.text = ("\(contador)")
        intUsersCounterLabel.text = ("\(contadorUsers)")
        
        splashView.backgroundColor = UIColor(red: CGFloat(config.redColor), green: CGFloat(config.greenColor), blue: CGFloat(config.blueColor), alpha: 1.0)
        view.addSubview(splashView)
        launchImage.contentMode = .scaleAspectFit
        splashView.addSubview(launchImage)
        splashView.removeFromSuperview()
    
        // FIXME: -- Change background color when design it's done.
        //simpleView?.backgroundColor = .systemPurple
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.bounces = scrollView.contentOffset.y > CGFloat(config.bounceY)
        scrollView.bounces = scrollView.contentOffset.x > CGFloat(config.bounceX)
    }
    @objc func checkTime(){
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        intHourLabel.text = ("\(hour)")
        intMinuteLabel.text = ("\(minutes)")
        intSecondLabel.text = ("\(seconds)")
    }
    
    @objc func clickRight(sender:UITapGestureRecognizer) {
            print("CLICK RIGHT")
            let vc = RegisterModalViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
    }
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
        
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return config.numberOfCells
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "outherCell", for: indexPath) as? NewsCarrouselCell {
            APICaller.shared.getTopStories { result in
                    cell.generate(articles: result)
            }
            
        if let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as? ButtonCell {

            if indexPath.row == 1 {
                return cell2
            }
        }
            
        if let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "LinksCell", for: indexPath) as? LinksCell {
            
            if indexPath.row == 2 {
                return cell3
            }
        }
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: config.widthLayout, height: config.heightLayout)
    }
}

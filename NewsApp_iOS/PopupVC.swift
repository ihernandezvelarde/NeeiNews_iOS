//
//  PopupVC.swift
//  NewsApp_iOS
//
//  Created by Irene on 18/8/22.
//

import Foundation
import UIKit
class PopupVc: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 10
        popupView.layer.masksToBounds = true
    }
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

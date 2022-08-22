//
//  ModalViewController.swift
//  NewsApp_iOS
//
//  Created by Irene on 19/8/22.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var rawTitle: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = rawTitle

        // Do any additional setup after loading the view.
    }
    @objc
    public convenience init(title: String) {
        self.init()
        self.rawTitle = title
    }

}

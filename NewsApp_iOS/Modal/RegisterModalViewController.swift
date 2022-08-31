//
//  RegisterModalViewController.swift
//  NewsApp_iOS
//
//  Created by Irene on 31/8/22.
//

import UIKit

class RegisterModalViewController: UIViewController {

    @IBOutlet weak var myCloseButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var contenedorLabels: UIView!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func closeModalViewButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

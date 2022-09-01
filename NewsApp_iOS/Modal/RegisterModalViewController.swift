//
//  RegisterModalViewController.swift
//  NewsApp_iOS
//
//  Created by Irene on 31/8/22.
//

import UIKit
import DropDown

class RegisterModalViewController: UIViewController {

    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var dropDownLabel: UILabel!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let dropDown = DropDown()
    let dropDownValues = ["Reader","Editor","Professional","Admin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        dropDownLabel.text = "Profile type*"
        dropDown.anchorView = dropDownView
        dropDown.dataSource = dropDownValues
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        dropDown.selectionAction = {[unowned self] (index: Int, item: String) in print("Selected item: \(item). At index: \(index)")
            self.dropDownLabel.text = dropDownValues[index]
        }
    }

    @objc func keyboardWillShow(notification:NSNotification) {

        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    @IBAction func dropDownButtonClick(_ sender: UIButton) {
        dropDown.show()
    }
    
    @IBAction func closeModalRegisterView(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func clickRegisterButton(_ sender: UIButton) {
        print("CLICK")
    }
}


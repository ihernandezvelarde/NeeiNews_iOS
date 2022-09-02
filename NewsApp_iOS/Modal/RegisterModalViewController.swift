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
    
    @IBOutlet weak var showPassword: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let dropDown = DropDown()
    let dropDownValues = ["Reader","Editor","Professional","Admin"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //iconImage.layer.shadowOffset = CGSize(width: -5,height: 5)
        //iconImage.layer.shadowRadius = 5.0
//        iconImage.layer.shadowColor = CGColor(red: 148, green: 85, blue: 255, alpha: 1.0)
//        iconImage.layer.shadowOpacity = 0.7
//        iconImage.layer.shadowRadius = 10
        registerButton.setTitle("Register", for: .normal)
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
    
    
    @IBAction func showPaswordClick(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry == false{
            passwordTextField.isSecureTextEntry = true
        }else{
            passwordTextField.isSecureTextEntry = false
        }
        
    }
    
    
    @IBAction func dropDownButtonClick(_ sender: UIButton) {
        dropDown.show()
    }
    
    @IBAction func closeModalRegisterView(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func clickRegisterButton(_ sender: UIButton) {
        //print("NOMBRE\(nameTextField.text)")
        let nombre: String = nameTextField.text ?? ""
        let apellidos: String = lastNameTextField.text ?? ""
        let edad: String = ageTextField.text ?? ""
        let email: String = emailTextField.text ?? ""
        let hola = Utils().ckeck(register: Register(nombre: nombre, apellido: apellidos, edad: edad, correo: email))
        print("AQUI\(hola)")
    }
}


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
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var myUIView: UIView!
    @IBOutlet weak var showPassword: UIButton!
    @IBOutlet weak var showRePassword: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let dropDown = DropDown()
    let config = ButtonCellConfig()
    let dropDownValues = ["Reader","Editor","Professional","Admin"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.placeholder = "Name*"
        lastNameTextField.placeholder = "Last name*"
        ageTextField.placeholder = "Age*"
        emailTextField.placeholder = "Email*"
        dropDownLabel.text = "Profile type*"
        passwordTextField.placeholder = "Password*"
        rePasswordTextField.placeholder = "Comfirm password*"
        
        nameTextField.textColor = .placeholderText
        lastNameTextField.textColor = .placeholderText
        ageTextField.textColor = .placeholderText
        emailTextField.textColor = .placeholderText
        dropDownLabel.textColor = .placeholderText
        passwordTextField.textColor = .placeholderText
        rePasswordTextField.textColor = .placeholderText

        myImageView.layer.cornerRadius = myImageView.frame.size.height/2
        myImageView.translatesAutoresizingMaskIntoConstraints = true
        
        myUIView.layer.cornerRadius = myImageView.frame.size.height/2
        myUIView.translatesAutoresizingMaskIntoConstraints = true
        myUIView.layer.shadowColor = UIColor.systemPurple.cgColor
        myUIView.layer.shadowOpacity = 40
        myUIView.layer.shadowOffset = CGSize.zero
        myUIView.layer.shadowRadius = 5
        
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
            self.dropDownLabel.textColor = .black
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
        if passwordTextField.isSecureTextEntry == false {
            passwordTextField.isSecureTextEntry = true
        }else{
            passwordTextField.isSecureTextEntry = false
        }
    }
    
    @IBAction func showRePasswordClick(_ sender: UIButton) {
        if rePasswordTextField.isSecureTextEntry == false {
            rePasswordTextField.isSecureTextEntry = true
        }else{
            rePasswordTextField.isSecureTextEntry = false
        }
    }
    
    @IBAction func dropDownButtonClick(_ sender: UIButton) {
        dropDown.show()
    }
    
    @IBAction func closeModalRegisterView(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func clickRegisterButton(_ sender: UIButton) {
        let nombre: String = nameTextField.text ?? ""
        let apellidos: String = lastNameTextField.text ?? ""
        let edad: String = ageTextField.text ?? ""
        let email: String = emailTextField.text ?? ""
        let tipo: String = dropDownLabel.text ?? "Profile type*"
        let contra : String = passwordTextField.text ?? ""
        let recontra: String = rePasswordTextField.text ?? ""
        
        let wrongValues = Utils().ckeck(register: Register(nombre: nombre, apellido: apellidos, edad: edad, correo: email, tipo: tipo, contra: contra, reContra: recontra))
        print(wrongValues)
        if wrongValues == [] {
            let controller = UIAlertController(title: "Everything is correct!", message: "Your registration has been completed successfully.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            })
            controller.addAction(ok)
            self.present(controller, animated: true, completion: nil)
            nameTextField.text = ""
            lastNameTextField.text = ""
            ageTextField.text = ""
            emailTextField.text = ""
            dropDownLabel.textColor = .placeholderText
            dropDownLabel.text = "Profile type*"
            passwordTextField.text = ""
            rePasswordTextField.text = ""
            
        }else{
            let controller = UIAlertController(title: "Something went wrong!", message: "Please, check:\n \(wrongValues.toPrint)", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(ok)
            self.present(controller, animated: true, completion: nil)
        }
    }
    
}
extension Array {
    var toPrint: String  {
        var str = ""
        for element in self {
            str += "- \(element)\n "
        }
        return str
    }
}



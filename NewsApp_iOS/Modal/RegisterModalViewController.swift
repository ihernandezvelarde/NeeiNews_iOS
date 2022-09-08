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
    
    
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var errorLastNameLabel: UILabel!
    @IBOutlet weak var ageErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var profileTypeErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var rePasswordErrorLabel: UILabel!
    
    let dropDown = DropDown()
    let config = ButtonCellConfig()
    let dropDownValues = ["Reader","Editor","Professional","Admin"]
    override func viewDidLoad() {
        super.viewDidLoad()
        nameErrorLabel.isHidden = true
        errorLastNameLabel.isHidden = true
        ageErrorLabel.isHidden = true
        emailErrorLabel.isHidden = true
        profileTypeErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        rePasswordErrorLabel.isHidden = true
        
        nameTextField.placeholder = "Name*"
        lastNameTextField.placeholder = "Last name*"
        ageTextField.placeholder = "Age*"
        emailTextField.placeholder = "Email*"
        dropDownLabel.text = "Profile type*"
        passwordTextField.placeholder = "Password*"
        rePasswordTextField.placeholder = "Comfirm password*"
        
        nameTextField.textColor = .black
        lastNameTextField.textColor = .black
        ageTextField.textColor = .black
        emailTextField.textColor = .black
        dropDownLabel.textColor = .placeholderText
        passwordTextField.textColor = .black
        rePasswordTextField.textColor = .black

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
            nameErrorLabel.isHidden = true
            errorLastNameLabel.isHidden = true
            ageErrorLabel.isHidden = true
            emailErrorLabel.isHidden = true
            profileTypeErrorLabel.isHidden = true
            passwordErrorLabel.isHidden = true
            rePasswordErrorLabel.isHidden = true
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
            
        } else {
            nameErrorLabel.isHidden = true
            errorLastNameLabel.isHidden = true
            ageErrorLabel.isHidden = true
            emailErrorLabel.isHidden = true
            profileTypeErrorLabel.isHidden = true
            passwordErrorLabel.isHidden = true
            rePasswordErrorLabel.isHidden = true
            for i in wrongValues {
                switch i {
                case "Name can't be empty.":
                    nameErrorLabel.isHidden = false
                    nameErrorLabel.text = "Name can't be empty."
                case "Name can't contain numbers and letters.":
                    nameErrorLabel.isHidden = false
                    nameErrorLabel.text = "Name can't contain numbers and letters."
                case "Name can't be only numbers.":
                    nameErrorLabel.isHidden = false
                    nameErrorLabel.text = "Name can't be only numbers."
                case "Name can't contains special characters.":
                    nameErrorLabel.isHidden = false
                    nameErrorLabel.text = "Name can't contains special characters."
                case "Last name can't be empty.":
                    errorLastNameLabel.isHidden = false
                    errorLastNameLabel.text = "Last name can't be empty."
                case "Last name can't contain numbers.":
                    errorLastNameLabel.isHidden = false
                    errorLastNameLabel.text = "Last name can't contain numbers."
                case "Last name can't be only numbers.":
                    errorLastNameLabel.isHidden = false
                    errorLastNameLabel.text = "Last name can't be only numbers."
                case "Last name can't contains special characters.":
                    errorLastNameLabel.isHidden = false
                    errorLastNameLabel.text = "Last name can't contains special chars."
                case "Age can't be empty.":
                    ageErrorLabel.isHidden = false
                    ageErrorLabel.text = "Age can't be empty."
                case "Age can't be letters and numbers.":
                    ageErrorLabel.isHidden = false
                    ageErrorLabel.text = "Age can't be letters and numbers."
                case "Age can't be letters.":
                    ageErrorLabel.isHidden = false
                    ageErrorLabel.text = "Age can't be letters."
                case "You must be over 16 years old and under 150 years old.":
                    ageErrorLabel.isHidden = false
                    ageErrorLabel.text = "Age must be over 16 and under 150."
                case "Email can't be empty.":
                    emailErrorLabel.isHidden = false
                    emailErrorLabel.text = "Email can't be empty."
                case "Email must have this structure: characters@characters.characters":
                    emailErrorLabel.isHidden = false
                    emailErrorLabel.text = "Structure: chars@chars.chars."
                case "You must select a type of profile.":
                    profileTypeErrorLabel.isHidden = false
                    profileTypeErrorLabel.text = "You must select a type of profile."
                case "Password can't be empty.":
                    passwordErrorLabel.isHidden = false
                    passwordErrorLabel.text = "Password can't be empty."
                case "Password can't be just numbers.":
                    passwordErrorLabel.isHidden = false
                    passwordErrorLabel.text = "Password can't be just numbers."
                case "Password can't be just letters.":
                    passwordErrorLabel.isHidden = false
                    passwordErrorLabel.text = "Password can't be just letters."
                case "Password must have at least 6 characters.":
                    passwordErrorLabel.isHidden = false
                    passwordErrorLabel.text = "Password must have 6 characters."
                case "Confirmation can't be empty.":
                    rePasswordErrorLabel.isHidden = false
                    rePasswordErrorLabel.text = "Confirmation can't be empty."
                case "You need to confirm the password.":
                    rePasswordErrorLabel.isHidden = false
                    rePasswordErrorLabel.text = "You need to confirm the password."
                case "The confirmation must be equal to the password.":
                    rePasswordErrorLabel.isHidden = false
                    rePasswordErrorLabel.text = "Passwords don't match."
                default:
                    print("Enjoy your day!")
                }
            }
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

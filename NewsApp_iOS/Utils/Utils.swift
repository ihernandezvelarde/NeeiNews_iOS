//
//  Utils.swift
//  NewsApp_iOS
//
//  Created by Irene on 24/8/22.
//

import Foundation

class Utils {
    
    func factory(number: Int) -> [Article] {
        let config = UtilsConfig()
        var array: [Article] = []
        for _ in 0...number {
            array.append(Article.init(title: config.title, description: config.text, url: config.url, urlToImage: "wrong", content: config.text, publishedAt: config.published, source: Source(id: "Id", name: "Name")))
        }
        return array
      }
    
    func ckeck(register: Register) -> [String] {
        var lista: [String] = []
        var characterSet = CharacterSet()
        var characterSetTwo = CharacterSet()
        characterSet.insert(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        characterSetTwo.insert(charactersIn: "0123456789")
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z-]+.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if register.name.rangeOfCharacter(from: characterSet) != nil && register.name.rangeOfCharacter(from: characterSetTwo) != nil {
            lista.append("Name can't contain numbers.")
        }else if register.name == "" {
            lista.append("Name can't be empty.")
        }else {}
        
        if register.lastName.rangeOfCharacter(from: characterSet) != nil && register.lastName.rangeOfCharacter(from: characterSetTwo) != nil {
            lista.append("Last name can't contain numbers.")
        }else if register.lastName == "" {
            lista.append("Last name can't be empty.")
        }else {}
        
        let edad = (register.age as NSString).integerValue
        if edad < 16 || edad > 150 {
            lista.append("You must be over 16 years old and under 150 years old.")
        }else if register.age == "" || register.age == "0" {
            lista.append("Age can't be empty.")
        }else if register.age.rangeOfCharacter(from: characterSetTwo) == nil && register.age.rangeOfCharacter(from: characterSet) != nil {
            lista.append("Age can't be letters.")
        }else {}
      
        if register.email == "" {
            lista.append("Email can't be empty.")
        }else if emailPred.evaluate(with: register.email) == false {
            lista.append("Email must have this structure: characters@characters.characters")
        }else {}
        
        if register.profileType == "Profile type*" {
            lista.append("You must select a type of profile.")
        }else {}
        
        if register.password == "" {
            lista.append("Password can't be empty.")
        }else if register.password.rangeOfCharacter(from: characterSet) == nil  {
            lista.append("Password can't be just numbers.")
        }else if register.password.rangeOfCharacter(from: characterSetTwo) == nil {
            lista.append("Password can't be just letters.")
        }else if register.password.count < 6 {
            lista.append("Password must have at least 6 characters.")
        }else {}
        
        if register.rePassword != register.password {
            lista.append("The confirmation must be equal to the password.")
        }else if register.rePassword != "" {
            lista.append("You need to confirm the password.")
        }else {}
        return lista
    }
}

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
        
        if register.name.rangeOfCharacter(from: characterSet) != nil && register.name.rangeOfCharacter(from: characterSetTwo) == nil && register.name != " " {
        }else{
            lista.append("Name")
        }
        if register.lastName.rangeOfCharacter(from: characterSet) != nil && register.lastName.rangeOfCharacter(from: characterSetTwo) == nil && register.lastName != " " {
        }else{
            lista.append("Last name")
        }
        if register.age.rangeOfCharacter(from: characterSetTwo) != nil && register.age.rangeOfCharacter(from: characterSet) == nil && Int(register.age) ?? 0 >= 16 && Int(register.age) ?? 0 <= 150 {
        }else{
            lista.append("Age")
        }
        if emailPred.evaluate(with: register.email) == true {
        }else{
            lista.append("Email")
        }
        if register.profileType != "Profile type*" {
        }else{
            lista.append("Profile type")
        }
        if register.password.rangeOfCharacter(from: characterSet) != nil && register.password.rangeOfCharacter(from: characterSetTwo) != nil && register.password != " " && register.password.count > 6 {
        }else{
            lista.append("Password")
        }
        if register.rePassword == register.password && register.rePassword != "" {
            
        }else{
            lista.append("Re-password")
        }
        return lista
    }
}

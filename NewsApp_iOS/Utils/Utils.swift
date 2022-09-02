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
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if register.name.rangeOfCharacter(from: characterSet) != nil && register.name.rangeOfCharacter(from: characterSetTwo) == nil && register.name != " " {
            lista.append("Nombre correcto")
        }else{
            lista.append("Nombre incorrecto")
        }
        if register.lastName.rangeOfCharacter(from: characterSet) != nil && register.lastName.rangeOfCharacter(from: characterSetTwo) == nil && register.lastName != " " {
            lista.append("Apellidos correctos")
        }else{
            lista.append("Apellidos incorrectos")
        }
        if register.age.rangeOfCharacter(from: characterSetTwo) != nil && register.age.rangeOfCharacter(from: characterSet) == nil && Int(register.age) ?? 0 >= 16 && Int(register.age) ?? 0 <= 150 {
            lista.append("Edad correcta")
        }else{
            lista.append("Edad incorrecta")
        }
        if emailPred.evaluate(with: register.email) == true {
            lista.append("Email correcto")
        }else{
            lista.append("Email incorrecto")
        }
        
        return lista
    }
}

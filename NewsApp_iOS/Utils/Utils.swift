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
        if Reachability.isConnectedToNetwork() == true{
        for _ in 0...number {
            array.append(Article.init(title: config.title, description: config.text, url: config.url, urlToImage: "wrong", content: config.text, publishedAt: config.published, source: Source(id: "Id", name: "Name")))
        }
        return array
        } else{
            for _ in 0...number {
                array.append(Article.init(title: config.titleTwo, description: config.text, url: "", urlToImage: "wrong", content: config.text, publishedAt: config.published, source: Source(id: "Id", name: "Name")))
        }
        return array
      }
    }
    
    func ckeck(register: Register) -> [String] {
        var lista: [String] = []
        var characterSet = CharacterSet()
        var characterSetTwo = CharacterSet()
        var characterSetThree = CharacterSet()
        
        characterSet.insert(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        characterSetTwo.insert(charactersIn: "0123456789")
        characterSetThree.insert(charactersIn: "\\/:*?\"<>|@!.,;-_´`{}^+[]ªº()&¬%¢$·#¿¡¨'")
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z-]+.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        //TODO: Hacer las cambiar las comprobaciones de register.name/ register.LastName por las trimmed
        let trimmedName = register.name.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedLastName = register.lastName.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmedName == "" || register.name == "" {
            lista.append("Name can't be empty.")
        }
        if register.name.rangeOfCharacter(from: characterSet) != nil && register.name.rangeOfCharacter(from: characterSetTwo) != nil {
            lista.append("Name can't contain numbers and letters.")
        } else if register.name.rangeOfCharacter(from: characterSetTwo) != nil {
            lista.append("Name can't be only numbers.")
        } else if register.name.rangeOfCharacter(from: characterSetThree) != nil{
            lista.append("Name can't contains special characters.")
        }
        
        if trimmedLastName == "" || register.lastName == "" {
            lista.append("Last name can't be empty.")
        }
        if register.lastName.rangeOfCharacter(from: characterSet) != nil && register.lastName.rangeOfCharacter(from: characterSetTwo) != nil {
            lista.append("Last name can't contain numbers.")
        } else if register.lastName.rangeOfCharacter(from: characterSetTwo) != nil {
            lista.append("Last name can't be only numbers.")
        } else if register.lastName.rangeOfCharacter(from: characterSetThree) != nil{
            lista.append("Last name can't contains special characters.")
        }
        
        if register.age == "" {
            lista.append("Age can't be empty.")
        } else if register.age.rangeOfCharacter(from: characterSetTwo) != nil && register.age.rangeOfCharacter(from: characterSet) != nil {
            lista.append("Age can't be letters and numbers.")
        } else if register.age.rangeOfCharacter(from: characterSet) != nil {
            lista.append("Age can't be letters.")
        }else if (register.age as NSString).integerValue < 16 || (register.age as NSString).integerValue > 150 {
            lista.append("You must be over 16 years old and under 150 years old.")
        }
      
        if register.email == "" {
            lista.append("Email can't be empty.")
        } else if emailPred.evaluate(with: register.email) == false {
            lista.append("Email must have this structure: characters@characters.characters")
        }
        
        if register.profileType == "Profile type*" {
            lista.append("You must select a type of profile.")
        }
        
        if register.password == "" {
            lista.append("Password can't be empty.")
        } else if register.password.rangeOfCharacter(from: characterSet) == nil  {
            lista.append("Password can't be just numbers.")
        } else if register.password.rangeOfCharacter(from: characterSetTwo) == nil {
            lista.append("Password can't be just letters.")
        } else if register.password.count < 6 {
            lista.append("Password must have at least 6 characters.")
        }
        if register.rePassword == "" {
            lista.append("Confirmation can't be empty.")
        }
        if register.password != "" {
            if register.rePassword == "" {
            lista.append("You need to confirm the password.")
            } else if register.rePassword != register.password {
            lista.append("The confirmation must be equal to the password.")
            }
        }
        return lista
    }
}

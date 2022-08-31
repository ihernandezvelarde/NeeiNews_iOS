//
//  Struct.swift
//  NewsApp_iOS
//
//  Created by Irene on 23/8/22.
//

import Foundation
import UIKit

struct UtilsConfig {
    var title:String = "Sorry something went wrong, we are working on it, please try again. We leave you with different curiosities and a link to the Dino game."
    var text: String = "· The elephant is the only mammal that cannot jump.                                                                           · A man named Charles Osborne had hiccups for 69 years.                                                                         · We blink more than 10,000,000 times in a year.                                                                            · A person has more than 1,460 dreams a year."
    var description: String = "This is the description,consectetur adipiscing elit. Nunc cursus convallis sapien eget semper. Nulla a metus nec nisl volutpat vulputate a sed metus. Etiam aliquam malesuada arcu vitae pellentesque."
    var published: String = "24-08-2022 11:00:05"
    var url: String = "https://dino-chrome.com/"
}

struct CarrouselConfig {
    var arrowLeft: String = "arrow.left.circle"
    var arrowRight: String = "arrow.right.circle"
    var numberOfNews: Int = 6
    var widthLayout: Int = 409
    var heightLayout: Int = 128
    var cero: Int = 0
}

struct ButtonCellConfig {
    var square: String = "square"
    var cornerRadius: CGFloat = 10
    var shadowOpacity: Float = 0.7
    var shadowRadius: CGFloat = 1.0
    var shadowWidth: CGFloat = -5
    var shadowHeight: CGFloat = 5
}

struct LinkCellConfig {
    var facebookImage: String = "facebook"
    var instagramImage: String = "instagram"
    var youtubeImage: String = "youtube"
    var facebookURL: String = "https://es-es.facebook.com/"
    var instagramURL: String = "https://www.instagram.com/"
    var youtubeURL: String = "https://www.youtube.com/"
    var buttonSize: Int = 20
}

struct MainConfig {
    var redColor: Int = 209/255
    var greenColor: Int = 209/255
    var blueColor: Int = 214/255
    var bounceY: Int = 100
    var bounceX: Int = 100
    var numberOfCells: Int = 3
    var widthLayout: Int = 365
    var heightLayout: Int = 165
}

struct TimeLineConfig {
    var radioButton: String = "radio-button"
    var redRadioButton: String = "radio-on-button-red"
    var line: String = "line"
    var hourEightAM: String = "8:00:00"
    var hourEightTwentyFive: String  = "8:25:00"
    var hourEightFourtyFive: String  = "8:45:00"
    var hourNineAM: String  = "9:00:00"
    var hourNineFive: String  = "9:05:00"
    var hourNineTen: String  = "9:10:00"
    var hourNineFifteen: String  = "9:15:00"
    var hourNineTwentyFive: String  = "9:25:00"
    var hourNineThirtyFive: String  = "9:35:00"
    var hourNineFourtyFive: String  = "9:45:00"
    var hourTen: String  = "10:00:00"
    var hourTenFifteen: String  = "10:15:00"
    var hourTenThirty: String  = "10:30:00"
    var hourEleven: String  = "11:00:00"
    var hourElevenThirty: String  = "11:30:00"
    var hourTwelve: String  = "12:00:00"
    var loremIpsum: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a facilisis lacus."
}

struct OptionsConfig {
    var radioButton: String = "radio-button"
    var radioButtonOn: String = "radio-on-button"
    var language: String = "LANGUAGE"
    var textFont: String = "Copperplate-Bold"
    var sobreLaApp: String = "About app"
    var permisos: String = "Dermissions"
    var catalan: String = "Catalan"
    var castellano: String = "Spanish"
    var ingles: String = "English"
}

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    var title: String? = "Cargando"
    var description: String? = "Cargando"
    var url: String? = "Cargando"
    var urlToImage: String = "Cargando"
    var content: String? = "Cargando"
    var publishedAt: String? = "Cargando"
    var source: Source = Source(id: "Id", name: "Name")
}

struct Source: Codable {
    let id: String?
    let name: String?
}

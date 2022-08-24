//
//  Struct.swift
//  NewsApp_iOS
//
//  Created by Irene on 23/8/22.
//

import Foundation
import UIKit

struct CarrouselConfig {
    var arrowLeft: String = "arrow.left.circle"
    var arrowRight: String = "arrow.right.circle"
    var numberOfNews: Int = 6
    var widthLayout: Int = 414
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
    var widthLayout: Int = 414
    var heightLayout: Int = 165
}

struct TimeLineConfig {
    var radioButton: String = "radio-button"
    var redRadioButton: String = "radio-on-button-red"
    var line: String = "line"
    var hourEightAM: String = "8:0:0"
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
    var lenguage: String = "LENGUAGE"
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
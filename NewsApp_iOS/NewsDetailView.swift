//
//  NewsDetailView.swift
//  NewsApp_iOS
//
//  Created by Irene on 9/8/22.
//

import Foundation
import UIKit
class NewsDetailView: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    var newsTitle = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsDescription = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsPublishedAt = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsPhoto = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsContent = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    var newsLink = ["Cargando","Cargando","Cargando","Cargando","Cargando","Cargando","Cargando"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("AQUI \(newsTitle[0])")
    }

    
}

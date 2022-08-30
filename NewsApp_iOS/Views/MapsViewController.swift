//
//  MapsViewController.swift
//  NewsApp_iOS
//
//  Created by Irene on 29/8/22.
//

import Foundation
import UIKit
import GoogleMaps
import MapKit


class MapsViewController: UIViewController, GMSMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let camara = GMSCameraPosition.camera(withLatitude: 37.787994, longitude: -122.407437, zoom: 15.0)
        let mapView = GMSMapView(frame: view.bounds, camera: camara)
        
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        mapView.settings.indoorPicker = false
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(mapView)
        //view.sendSubviewToBack(mapView)
        mapView.isHidden = false
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.787994, longitude: -122.407437)
        marker.title = "Apple Union Square"
        marker.snippet = "San Francisco"
        marker.map = mapView
        
//        if mapView.isMyLocationEnabled ==  false {
//            let controller = UIAlertController(title: "No Internet Detected", message: "This app requires an Internet connection", preferredStyle: .alert)
//            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
//            controller.addAction(ok)
//            present(controller, animated: true, completion: nil)
//        }
    }

}

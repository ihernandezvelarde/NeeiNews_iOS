//
//  MapsViewController.swift
//  NewsApp_iOS
//
//  Created by Irene on 29/8/22.
//

import Foundation
import CoreLocationUI
import UIKit
import CoreLocation
import MapKit


class MapsViewController: UIViewController, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        mapView.frame = CGRect(x: 0, y: 35, width: view.frame.self.width, height: view.frame.size.height)
        mapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3318, longitude: -122.0312), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        manager.delegate = self
        view.backgroundColor = UIColor(red: 213 / 255.0, green: 209 / 255.0, blue: 255 / 255.0, alpha: 1.0)
        createButton()
    }
    private func createButton(){
        let button = CLLocationButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.backgroundColor = .systemPurple
        button.cornerRadius = 200
        button.label = .none
        button.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        button.icon = .arrowOutline
        button.center = CGPoint(x: view.center.x + 156, y: view.frame.size.height - 125)
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    @objc func didTapButton() {
        manager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        //self.manager.stopUpdatingLocation()
        mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: true)
    }
}

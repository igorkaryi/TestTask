//
//  MapViewController.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: BaseViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!

    var viewModel: MapProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        title = viewModel.title
        openMapForPlace(name: viewModel.title,
                        longitude: viewModel.longitude,
                        latitude: viewModel.latitude)
    }
    
    func openMapForPlace(name: String, longitude: String, latitude: String) {
        let location = CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = name
        mapView.addAnnotation(annotation)
    }

    @IBAction func backAction(_: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}

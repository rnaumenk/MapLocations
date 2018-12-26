//
//  ViewController.swift
//  MapLocations
//
//  Created by Ruslan on 12/20/18.
//  Copyright © 2018 Ruslan Naumenko. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, SetLocationDelegate {
    
    private var index: Int?
    private let locationManager = CLLocationManager()
    
    @IBAction func locationButton(_ sender: Any) {
        self.locationManager.startUpdatingLocation()
    }
    
    @IBOutlet weak var mapView: MKMapView!
    weak var secondVC : ListController?
    
    @IBAction func segmentedAction(_ sender: MySegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = MKMapType.standard
        case 1:
            mapView.mapType = MKMapType.satellite
        case 2:
            mapView.mapType = MKMapType.hybrid
        default:
            print("Unknown Segment Controller Index (\(sender.selectedSegmentIndex))")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        index = 0
        
        secondVC = self.tabBarController?.viewControllers?[1] as! ListController?
        secondVC?.delegate = self
        self.mapView.delegate = self
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.mapView.showsUserLocation = true
        
        for location in Locations.location {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.subtitle = location.description
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.2.coordinate.latitude, longitude: location.2.coordinate.longitude)
            mapView.addAnnotation(annotation)
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            
            for i in 0..<Locations.location.count {
                if let ann = annotation as? MKPointAnnotation {
                    if ann.title == Locations.location[i].0 {
                        annotationView!.pinTintColor = Locations.location[i].4
                    }
                }
            }
            
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func setNewLocationIndex(_ newValue: Int) {
        index = newValue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        centerMapOnLocation(index!)
    }
    
    private func centerMapOnLocation(_ index: Int)
    {
        let span:MKCoordinateSpan = Locations.location[index].3
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(Locations.location[index].2.coordinate.latitude, Locations.location[index].2.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        self.mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

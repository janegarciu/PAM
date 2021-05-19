//
//  MapViewController.swift
//  Traveller
//
//  Created by Jane  on 5/19/21.
//  Copyright © 2021 Jane's company. All rights reserved.
//
import UIKit
import MapKit
import GooglePlaces

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var searchResult: String = ""
    var resultsViewController: GMSAutocompleteResultsViewController?
       var searchController: UISearchController?
       override func viewDidLoad() {
           super.viewDidLoad()
        resultsViewController?.delegate = self
           setupSearchController()
       }
       func setupSearchController() {
           resultsViewController = GMSAutocompleteResultsViewController()
           searchController = UISearchController(searchResultsController: resultsViewController)
           searchController?.searchResultsUpdater = resultsViewController

           let searchBar = searchController!.searchBar
           searchBar.sizeToFit()
           searchBar.text = searchResult
           searchBar.placeholder = "Search for places"
           navigationItem.titleView = searchController?.searchBar
           definesPresentationContext = true
           searchController?.hidesNavigationBarDuringPresentation = false
       }
}

extension MapViewController: GMSAutocompleteResultsViewControllerDelegate {
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
       
        searchController?.isActive = false

    
        mapView.removeAnnotations(mapView.annotations)

      
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: place.coordinate, span: span)
        mapView.setRegion(region, animated: true)

   
        let annotation = MKPointAnnotation()
        annotation.coordinate = place.coordinate
        annotation.title = place.name
        annotation.subtitle = place.formattedAddress
        mapView.addAnnotation(annotation)
        
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
        
        print("Error: \(error.localizedDescription)")

    }
}

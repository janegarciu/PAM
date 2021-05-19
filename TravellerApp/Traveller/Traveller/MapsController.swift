//
//  MapsController.swift
//  Traveller
//
//  Created by Jane  on 4/23/21.
//  Copyright © 2021 Jane's company. All rights reserved.
//

import UIKit
import MapKit
import GooglePlaces

class MapsController: UIViewController {

    @IBOutlet weak var mapsView: MKMapView!
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        // Do any additional setup after loading the view.
    }
    func setupSearchController() {
        resultsViewController = GMSAutocompleteResultsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController

        let searchBar = searchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = searchController?.searchBar
        definesPresentationContext = true
        searchController?.hidesNavigationBarDuringPresentation = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

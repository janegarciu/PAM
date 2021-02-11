//
//  OtherViewController.swift
//  MobileApp
//
//  Created by Jane  on 2/11/21.
//  Copyright © 2021 Jane's company. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {
    
    var myString = String()
    @IBOutlet weak var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.text = myString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(_ sender: Any) {
        if field.text != ""
        {
            performSegue(withIdentifier: "back", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstController = segue.destination as! ViewController
        firstController.myString = field.text!
    }
}

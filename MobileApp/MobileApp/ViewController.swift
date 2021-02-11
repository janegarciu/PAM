//
//  ViewController.swift
//  MobileApp
//
//  Created by Jane  on 2/11/21.
//  Copyright © 2021 Jane's company. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var myString = String()
    
    @IBAction func done(_ sender: Any) {
        if textField.text != ""
        {
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! OtherViewController
        secondController.myString = textField.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = myString
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}


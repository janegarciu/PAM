
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onGoButton(_ sender: UIButton) {
        performSegue(withIdentifier: "MySegue", sender: self)

    }
    
}


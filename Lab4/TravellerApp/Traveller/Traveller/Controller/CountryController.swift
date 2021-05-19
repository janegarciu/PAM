

import UIKit

class CountryController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func post(_ sender: Any) {
    }
    
    var result: String = ""
//    var countryName: Array<String> = [];
      var countryName = [""]
      let flag = [UIImage(named: "abkhazia"),UIImage(named: "afghanistan"),UIImage(named: "aland-islands"),UIImage(named: "albania"),UIImage(named: "algeria"),UIImage(named: "american-samoa"),UIImage(named: "andorra"),UIImage(named: "angola"),UIImage(named: "anguilla"),UIImage(named: "antigua-and-barbuda"),UIImage(named: "argentina"),UIImage(named: "armenia"),UIImage(named: "aruba"),UIImage(named: "australia"),UIImage(named: "austria"),UIImage(named: "azerbaijan"),UIImage(named: "azores-islands"),UIImage(named: "bahamas"),UIImage(named: "bahrain"),UIImage(named: "balearic-islands"),UIImage(named: "bangladesh")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let url = URL(string: "https://restcountries.eu/rest/v2/all")!
             let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                 guard let safeData = data else { return }

                 let json = try? JSONSerialization.jsonObject(with: safeData, options: []) as? [Any]
                 let countries = json!.map { country in
                     (country as! [String: Any])["name"]!
                 }
                
                countries.forEach { (lala) in
                    self.countryName.append(lala as! String)
                }
            
                
             }

             task.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countryName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        cell.countryName.text = self.countryName[indexPath.row]
        cell.flag.image = flag[indexPath.row]
        result = countryName[indexPath.row]
        
         return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    let width = view.frame.size.width - 22
    return CGSize(width: width - 16, height: 95)
    }
        
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape,
            let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = view.frame.width
            layout.itemSize = CGSize(width: width - 16, height: 160)
            layout.invalidateLayout()
        } else if UIDevice.current.orientation.isPortrait,
            let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = view.frame.width
            layout.itemSize = CGSize(width: width - 16, height: 160)
            layout.invalidateLayout()
        }
    }
    @objc func tap(_ sender: UITapGestureRecognizer) {
    let location = sender.location(in: self.collectionView)
    let indexPath = self.collectionView.indexPathForItem(at: location)

    if let index = indexPath {
       print("Got clicked on index: \(index)!")
    }
    performSegue(withIdentifier: "SegueToMap", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToMap" {
            _ = segue.destination as! UINavigationController
            let mapController = MapViewController()
            mapController.searchResult = result
            }
        }
}



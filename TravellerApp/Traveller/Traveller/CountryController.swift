

import UIKit

class CountryController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
      let countryName = ["Abkhazia", "Afghanistan", "Aland-islands", "Albania", "Algeria", "American-samoa", "Andorra", "Angola", "Anguilla", "Antigua-and-barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Azores-islands", "Bahamas", "Bahrain", "Balearic-islands", "Bangladesh"]
      let flag = [UIImage(named: "abkhazia"),UIImage(named: "afghanistan"),UIImage(named: "aland-islands"),UIImage(named: "albania"),UIImage(named: "algeria"),UIImage(named: "american-samoa"),UIImage(named: "andorra"),UIImage(named: "angola"),UIImage(named: "anguilla"),UIImage(named: "antigua-and-barbuda"),UIImage(named: "argentina"),UIImage(named: "armenia"),UIImage(named: "aruba"),UIImage(named: "australia"),UIImage(named: "austria"),UIImage(named: "azerbaijan"),UIImage(named: "azores-islands"),UIImage(named: "bahamas"),UIImage(named: "bahrain"),UIImage(named: "balearic-islands"),UIImage(named: "bangladesh")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countryName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.countryName.text = countryName[indexPath.row]
        cell.flag.image = flag[indexPath.row]
        
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    let width = view.frame.size.width - 22
    return CGSize(width: width - 16, height: 95)
    }
        
    
    public override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
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
    
}

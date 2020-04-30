//
//  TabVC.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/12/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit
import Kingfisher

class MainTabVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var window: UIWindow?
    
    var Categories = [MainCategories]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        hundleRefrech()
    }
    
    private func hundleRefrech() {
        Api.mainCategories { (error: Error?, Categories: [MainCategories]?) in
            if let categories = Categories {
                self.Categories = categories
                self.collectionView.reloadData()
            }
        }
    }
    
    
}
extension MainTabVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: categoriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! categoriesCell
        cell.nameLabel.text =  Categories[indexPath.row].name
        cell.imageView.kf.setImage(with: URL(string: Categories[indexPath.row].image))

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if Categories[indexPath.row].id == 1 {
            // go to details Super market
            print("details Super market")
          
            let supermarketVC = storyboard?.instantiateViewController(withIdentifier: "detailsSuperMarket") as! superMarketVC
            self.present(supermarketVC, animated: true, completion: nil)
            
        } else if Categories[indexPath.row].id == 2 || Categories[indexPath.row].id == 8 || Categories[indexPath.row].id == 7 || Categories[indexPath.row].id == 3  {
            // go to details Sooq, libya , peices and pharmacy
            print("details Sooq, libya , peices and pharmacy ")
            
            let sooqVC = storyboard?.instantiateViewController(withIdentifier: "detailsSooq") as! sooqVC
            self.present(sooqVC, animated: true, completion: nil)
            
        } else if Categories[indexPath.row].id == 4 {
            // go to details restuarant
            print("details restuarant")
            
            let restaurantsVC = storyboard?.instantiateViewController(withIdentifier: "detailsRestaurants") as! RestaurantsVC
            self.present(restaurantsVC, animated: true, completion: nil)
            
        } else if Categories[indexPath.row].id == 6 {
            // go to details Clothes
            print("details Clothes")
            
            let clothesVC = storyboard?.instantiateViewController(withIdentifier: "detailsClothes") as! ClothesVC
            self.present(clothesVC, animated: true, completion: nil)
            
        }
        
    }
   
}


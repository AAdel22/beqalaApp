//
//  ClothesVC.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/22/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit
import Kingfisher

class ClothesVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var Clothes = [CategoriesOfClothes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        hundleRefrech()
    }
    
    private func hundleRefrech() {
        Api.categoreisOfClothes { (error: Error?, clothes: [CategoriesOfClothes]?) in
            if let clothes = clothes {
                self.Clothes = clothes
                self.collectionView.reloadData()
            }
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ClothesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Clothes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: clothesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "clothesCell", for: indexPath) as! clothesCell
        cell.nameLabel.text = Clothes[indexPath.row].name
        cell.imageView.kf.setImage(with: URL(string: Clothes[indexPath.row].image))
        
        return cell
    }
    
}


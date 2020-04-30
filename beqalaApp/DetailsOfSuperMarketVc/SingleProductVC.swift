//
//  PersilProductVC.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/30/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit
import Kingfisher

class SingleProductVC: UIViewController {
    
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var descriptionProductLabel: UILabel!
    
   
    
    @IBOutlet weak var collectionViewOne: UICollectionView!
    
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    @IBOutlet weak var tableViewOne: UITableView!
    
    @IBOutlet weak var tableViewTwo: UITableView!
    
    var window: UIWindow?
    var singleProductGallery = [SingleProductGallery]()
    var singleProductUnits = [SingleProductUnits]()
    var singleProductSizes = [SingleProductSizes]()
    var singleProductNameDescription = [SingleProductNameDescription]()
    var singleNameAndDescription:SingleProductNameDescription!
    
    var idProduct:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
        
        tableViewOne.delegate = self
        tableViewOne.dataSource = self
        tableViewTwo.delegate = self
        tableViewTwo.dataSource = self
        
        hundleRefresh()
        
        Api.SingleProductIdNameAndDes(id: idProduct) { (error: Error?, singleProductNameDescription: SingleProductNameDescription?) in
            self.updateUI()
            }
        
        
    }
    func updateUI() {
        
        nameProductLabel.text = singleNameAndDescription.name
    }
    
    private func hundleRefresh() {
        Api.SingleProductIdGallery(id: idProduct) { (error: Error?, singleProductGallery: [SingleProductGallery]?) in
            if let singleProductGallery = singleProductGallery {
                self.singleProductGallery = singleProductGallery
                self.collectionViewOne.reloadData()
            }
        }
        Api.SingleProductIdUnits(id: idProduct) { (error: Error?, singleProductUnits: [SingleProductUnits]?) in
            if let singleProductUnits = singleProductUnits {
                self.singleProductUnits = singleProductUnits
                self.tableViewOne.reloadData()
            }
        }
        Api.SingleProductIdSizes(id: idProduct) { (error: Error?, singleProductSizes: [SingleProductSizes]?) in
            if let singleProductSizes = singleProductSizes {
                self.singleProductSizes = singleProductSizes
                self.tableViewTwo.reloadData()
            }
        }
//        Api.SingleProductIdNameAndDes(id: idProduct) { (error: Error?, singleProductNameDescription: [SingleProductNameDescription]?) in
//            if let singleProductNameDescription = singleProductNameDescription {
//                self.singleProductNameDescription = singleProductNameDescription
//                self.collectionViewTwo.reloadData()
//            }
//        }
        
    }
    
    @IBAction func plusBtn(_ sender: Any) {
        if Int(labelCount.text!)! <= 7 {
            labelCount.text = String(Int(labelCount.text!)! + 1)
        }
    }
    
    @IBAction func minusBtn(_ sender: Any) {
        if Int(labelCount.text!)! >= 1 {
            labelCount.text = String(Int(labelCount.text!)! - 1)
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
extension SingleProductVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewOne {
            return singleProductGallery.count
        } else {
            return singleProductNameDescription.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewOne {
            let cell: singleProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "singleProductCell", for: indexPath) as! singleProductCell
            
            cell.imageViewgallery.kf.setImage(with: URL(string: singleProductGallery[indexPath.row].image))
            
            return cell
        } else {
            let cell: descriptionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "descriptionCell", for: indexPath) as! descriptionCell
            
            cell.descriptionLabel.text = singleProductNameDescription[indexPath.row].des
            print("description cell : \(singleProductNameDescription[indexPath.row].des)")
            return cell
        }
        
    }
}
extension SingleProductVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableViewOne {
            print("Count -> \(singleProductUnits.count)")
            return singleProductUnits.count
        }else {
            print("Count -> \(singleProductSizes.count)")
            return singleProductSizes.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableViewOne {
            let cell: UnitsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UnitsTableViewCell", for: indexPath) as! UnitsTableViewCell
            cell.unitLabel.text = singleProductUnits[indexPath.row].name
            return cell
        } else {
            let cell: SizesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SizesTableViewCell", for: indexPath) as! SizesTableViewCell
            cell.sizeLabel.text = singleProductSizes[indexPath.row].name
            return cell
        }
    }
}


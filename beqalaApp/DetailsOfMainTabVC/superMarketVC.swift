//
//  superMarketVc.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/22/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit
import Kingfisher

class superMarketVC: UIViewController {
    
    @IBOutlet weak var collectionViewOne: UICollectionView!
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
   
    
    
    var window: UIWindow?
    
    var SerachProducts = [SearchProducts]()
    
    var Products = [AllProducts]()
    var Categorie = [Categories]()
    var SubCategorie = [SubCategories]()
    var SubCategorieId = [SubCategoriesId]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
        
        searchBar.delegate = self
       
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        
        hundleRefrech()
    }
    
    
    private func hundleRefrech() {
        Api.searchProducts { (error: Error?, searchProducts: [SearchProducts]?) in
            if let searchProducts = searchProducts {
                self.SerachProducts = searchProducts
            }
        }
        Api.categoreis { (error: Error?, categorie: [Categories]?) in
            if let categorie = categorie {
                self.Categorie = categorie
                self.collectionViewOne.reloadData()
            }
        }

        Api.allProducts { (error: Error?, products: [AllProducts]?) in
            if let products = products {
                self.Products = products
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
extension superMarketVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell {
            cell.productNameLable.text = Products[indexPath.row].name
            cell.productImageView.kf.setImage(with: URL(string: Products[indexPath.row].image))
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let idProduct = Products[indexPath.row].id
        let singleProductVC = storyboard?.instantiateViewController(withIdentifier: "SingleProductVC") as! SingleProductVC
        singleProductVC.idProduct = idProduct
        
        self.present(singleProductVC, animated: true, completion: nil)
        
        print(idProduct)
    }
}
extension superMarketVC: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewOne {
            return Categorie.count
        } else {
            return SubCategorie.count
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewOne {
            let cell: mainCategoriesCell = collectionViewOne.dequeueReusableCell(withReuseIdentifier: "mainCategoriesCell", for: indexPath) as! mainCategoriesCell
            cell.nameLabel.text = Categorie[indexPath.row].name
            cell.imageView.kf.setImage(with: URL(string: Categorie[indexPath.row].image))
            return cell
        } else {
            let cell: subMainCategoriesCell = collectionViewTwo.dequeueReusableCell(withReuseIdentifier: "subMainCategoriesCell", for: indexPath) as! subMainCategoriesCell
            cell.nameLAbel.text = SubCategorie[indexPath.row].name
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewOne {
            Api.subCategoreis(id: Categorie[indexPath.row].id) { (error: Error?, subCategorie: [SubCategories]?) in
                
                if let subCategorie = subCategorie {
                    self.SubCategorie = subCategorie
                    self.collectionViewTwo.reloadData()
                }
            }
        } else {
            
            Api.gatProductsById(id: SubCategorie[indexPath.row].id) { (err, data) in
               self.Products = data ?? []
                self.tableView.reloadData()
            }
        }
    }
}

extension superMarketVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       let productsFilterd = Products.filter({ $0.name.contains(searchText) })
        self.Products = productsFilterd
        self.tableView.reloadData()
    }
}


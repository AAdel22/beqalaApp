//
//  FavouriteTabVC.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/25/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit

class FavouriteTabVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var Favourite = [ProductFavourite]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        hundleRefrech()
    }
    
    private func hundleRefrech() {
        
    }
}

extension FavouriteTabVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Favourite.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavourite", for: indexPath) as! favouriteCell
        cell.productFavNameLabel.text = Favourite[indexPath.row].name
        return cell
    }
}

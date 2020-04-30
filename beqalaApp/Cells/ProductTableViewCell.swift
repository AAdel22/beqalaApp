//
//  ProductTableViewCell.swift
//  beqalaApp
//
//  Created by Alaa Adel on 11/10/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLable: UILabel!
    
    var id : Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func favouritBtn(_ sender: Any) {
        Api.favouritePost(id: id ?? 0) { (error: Error?, success: Bool) in
            if success {
                print("success")
            }else {
                print("error")
            }
        }
    }
    
}

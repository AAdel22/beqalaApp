//
//  sooqVC.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/22/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit

class sooqVC: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var mainCategoryId = MainCategories().id
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addToCarBtn(_ sender: Any) {
        Api.addItemToCart(quantity: 1, message: textView.text, mainCategoryId: mainCategoryId) { (error: Error?, success: Bool) in
            if success {
                
                print("success")
            }else {
                print("error")
            }
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

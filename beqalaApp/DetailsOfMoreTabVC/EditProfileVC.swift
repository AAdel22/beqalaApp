//
//  EditProfileVC.swift
//  beqalaApp
//
//  Created by Alaa Adel on 11/13/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var mobileNumberTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var locationTxt: UITextField!
    

    var imagePicker = UIImagePickerController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        let userName = UserDefaults.standard.value(forKey: "userName")
        let mobileNumber = UserDefaults.standard.value(forKey: "mobileNumber")
        let email = UserDefaults.standard.value(forKey: "email")
        let location = UserDefaults.standard.value(forKey: "location")
        
        userNameTxt.text = userName as? String
        mobileNumberTxt.text = mobileNumber as? String
        emailTxt.text = email as? String
        locationTxt.text = location as? String
        // Do any additional setup after loading the view.
    }

    @IBAction func editImageProfileBTn(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func saveEditBtn(_ sender: Any) {
        
//        let img = imageProfile.image
        
        let userName = userNameTxt.text
        let mobileNumber = mobileNumberTxt.text
        let email = emailTxt.text
        let location = locationTxt.text
        
//        UserDefaults.standard.set(img, forKey: "ImgProfile")
        
        UserDefaults.standard.setValue(userName, forKey: "userName")
        UserDefaults.standard.setValue(mobileNumber, forKey: "mobileNumber")
        UserDefaults.standard.setValue(email, forKey: "email")
        UserDefaults.standard.setValue(location, forKey: "location")
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
extension EditProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            imageProfile.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

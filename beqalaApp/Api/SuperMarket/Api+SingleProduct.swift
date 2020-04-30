//
//  Api+SingleProduct.swift
//  beqalaApp
//
//  Created by Alaa Adel on 10/24/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension Api {
    class func SingleProductIdGallery(id: Int,completion: @escaping (_ error: Error?, _ products: [SingleProductGallery]?)-> Void) {
        
        let url = "https://bqala.panorama-q.com/api/products/single/\(id)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let dataArr = json["data"]["gallery"].array else {
                    completion(nil,nil)
                    return
                }
                var products = [SingleProductGallery]()
                for data in dataArr {
                    guard let data = data.dictionary else {return}
                    let product = SingleProductGallery()
                    product.image = data["image"]?.string ?? ""
                    products.append(product)
                }
                completion(nil,products)
            }
        }
    }
    class func SingleProductIdUnits(id: Int,completion: @escaping (_ error: Error?, _ products: [SingleProductUnits]?)-> Void) {
        
        let url = "https://bqala.panorama-q.com/api/products/single/\(id)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let dataArr = json["data"]["units"].array else {
                    completion(nil,nil)
                    return
                }
                var products = [SingleProductUnits]()
                for data in dataArr {
                    guard let data = data.dictionary else {return}
                    let product = SingleProductUnits()
                    product.name = data["name"]?.string ?? ""
                    products.append(product)
                }
                completion(nil,products)
            }
        }
    }
    class func SingleProductIdSizes(id: Int,completion: @escaping (_ error: Error?, _ products: [SingleProductSizes]?)-> Void) {
        
        let url = "https://bqala.panorama-q.com/api/products/single/\(id)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let dataArr = json["data"]["sizes"].array else {
                    completion(nil,nil)
                    return
                }
                var products = [SingleProductSizes]()
                for data in dataArr {
                    guard let data = data.dictionary else {return}
                    let product = SingleProductSizes()
                    product.name = data["name"]?.string ?? ""
                    products.append(product)
                }
                completion(nil,products)
            }
        }
    }
    class func SingleProductIdNameAndDes(id: Int,completion: @escaping (_ error: Error?, _ products: SingleProductNameDescription?)-> Void) {
        
        let url = "https://bqala.panorama-q.com/api/products/single/\(id)"
        let Product = SingleProductNameDescription()
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
             let result = response.result
            if let data = result.value as? Dictionary<String, AnyObject> {
                if let name = data["name"] as? String {
                    Product.name = name
                    print(name)
                }
            }

        }
        
//        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
//
//            switch response.result {
//            case .failure(let error):
//                completion(error, nil)
//                print(error)
//            case .success(let value):
//                let json = JSON(value)
//                print(json)
//                guard let dataArr = json["data"].array else {
//
//                    completion(nil,nil)
//                    return
//                }
//
//                var products = [SingleProductNameDescription]()
//                for data in dataArr {
//                    guard let data = data.dictionary else {return}
//                    let product = SingleProductNameDescription()
//                    product.name = data["name"]?.string ?? ""
//                    product.des = data["description"]?.string ?? ""
//                    products.append(product)
//                }
//                completion(nil,products)
//            }
//        }
    }
}

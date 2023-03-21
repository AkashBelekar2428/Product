//
//  ProductResponse.swift
//  ProductApi
//
//  Created by Akash Belekar on 16/03/23.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

struct productResponseData:Mappable{
   
    var product:[ProductResponse]?
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        product <- map["products"]
       
    }
}

struct ProductResponse:Mappable{

    var title:String?
    var description:String?
    var price:Double?
    var rating:Float?
    var stock:Int?
    var brand:String?
    var categori:String?
    var thumbnail:String?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        title <- map["title"]
        description <- map["description"]
        price <- map["price"]
        rating <- map["rating"]
        stock <- map["stock"]
        brand <- map["brand"]
        categori <- map["category"]
        thumbnail <- map["thumbnail"]
    }
    
    
}

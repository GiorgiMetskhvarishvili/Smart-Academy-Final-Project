//
//  CarModelJson.swift
//  FinalProjectiOS
//
//  Created by Gi Oo on 28.12.21.
//

import Foundation

class Cars {
    var year: Int
    var id: Int
    var horsepower: Int
    var make: String
    var model: String
    var price: Double
    var img_url: String
    
    var count: Int
    
    init(year: Int, id: Int, horsepower: Int, make: String, model: String, price: Double, img_url: String) {
        self.year = year
        self.id = id
        self.horsepower = horsepower
        self.make = make
        self.model = model
        self.price = price
        self.img_url = img_url
        self.count = 0
    }
    
    func increase() -> Void {
        self.count = self.count + 1
    }
    
    func decrease() -> Void {
        self.count = max(0, self.count - 1)
    }
}

struct CarRawData:Codable{
    var year: Int
    var id: Int
    var horsepower: Int
    var make: String
    var model: String
    var price: Double
    var img_url: String
}

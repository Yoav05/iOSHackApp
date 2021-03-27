//
//  CityModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

struct CityModel {
    var title: String
    
    var longtitude: Point?
    var latitude: Point?
    
    struct Point {
        var x: Double
        var y: Double
    }
}

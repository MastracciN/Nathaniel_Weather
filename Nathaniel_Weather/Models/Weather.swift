//
//  Weather.swift
//  Nathaniel_Weather
//
//  Created by user929441 on 11/13/21.
//

import Foundation

struct Weather: Codable{
    var location : Location
    var current : Current
    
    enum CodingKeys: String, CodingKey{
        case location, current
    }
    
    init(){
        location = Location()
        current = Current()
    }
    
}

struct Location: Codable{
    var name : String
    var country : String
    
    enum CodingKeys: String, CodingKey{
        case name, country
    }
    
    init(){
        name = "name"
        country = "country"
    }
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try response.decodeIfPresent(String.self, forKey: .name) ?? "name"
        self.country = try response.decodeIfPresent(String.self, forKey: .country) ?? "country"
    }
}

struct Current: Codable{
    var temp : Double
    var feelsLike : Double
    var windKph : Double
    var windDir : String
    var humidity : Int
    var uv : Double
    var vis : Double
    var condition : Condition
    
    enum CodingKeys: String, CodingKey{
        case temp = "temp_c"
        case feelsLike = "feelslike_c"
        case windKph = "wind_kph"
        case windDir = "wind_dir"
        case humidity
        case uv
        case vis = "vis_km"
        case condition
    }
    
    init(){
        temp = 0.0
        feelsLike = 0.0
        windKph = 0.0
        windDir = "windDir"
        humidity = 0
        uv = 0.0
        vis = 0.0
        condition = Condition()
    }
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temp = try response.decodeIfPresent(Double.self, forKey: .temp) ?? 0.0
        self.feelsLike = try response.decodeIfPresent(Double.self, forKey: .feelsLike) ?? 0.0
        self.windKph = try response.decodeIfPresent(Double.self, forKey: .windKph) ?? 0.0
        self.windDir = try response.decodeIfPresent(String.self, forKey: .windDir) ?? "windDir"
        self.humidity = try response.decodeIfPresent(Int.self, forKey: .humidity) ?? 0
        self.uv = try response.decodeIfPresent(Double.self, forKey: .uv) ?? 0.0
        self.vis = try response.decodeIfPresent(Double.self, forKey: .vis) ?? 0.0
        condition = try Condition(from: decoder)
    }
}

struct Condition : Codable {
    var text : String
    var icon : String
    
    enum CodingKeys: String, CodingKey{
        case text, icon
    }
    
    init(){
        text = "text"
        icon = "icon"
    }
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        self.text = try response.decodeIfPresent(String.self, forKey: .text) ?? "text"
        self.icon = try response.decodeIfPresent(String.self, forKey: .icon) ?? "icon"
    }
}

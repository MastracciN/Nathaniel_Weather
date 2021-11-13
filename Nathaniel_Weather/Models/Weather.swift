//
//  Weather.swift
//  Nathaniel_Weather
//
//  Created by user929441 on 11/13/21.
//

import Foundation

struct Weather: Codable, Identifiable{
    var temp : Double
    var feelsLike : Double
    var windKph : Double
    var windDir : String
    var humidity : Int
    var uv : Double
    var vis : Double
    var conditionText : String
    
    var name: String
    var country : String
    
    enum CodingKeys: String, CodingKey{
        case temp = "temp_c"
        case feelsLike = "feelslike_c"
        case windKph = "wind_kph"
        case windDir = "wind_dir"
        case humidity = "humidity"
        case uv = "uv"
        case vis = "vis_km"
        case conditionText = "text"
        case condition = "condition"
        case current = "current"
        
        case name = "name"
        case country = "country"
        case location = "location"
    }
    
    init (){
        temp = 0.0
        feelsLike = 0.0
        windKph = 0.0
        windDir = "whoosh"
        humidity = 0
        uv = 0.0
        vis = 0.0
        conditionText = "upupup"
    }
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temp = try response.decodeIfPresent(Double.self, forKey: .temp) ?? 0
        self.feelsLike = try response.decodeIfPresent(Double.self, forKey: .feelsLike) ?? 0
        self.windKph = try response.decodeIfPresent(Double.self, forKey: .windKph) ?? 0
        self.windDir = try response.decodeIfPresent(String.self, forKey: .windDir) ?? "NA"
        self.humidity = try response.decodeIfPresent(Int.self, forKey: .humidity) ?? 0
        self.uv = try response.decodeIfPresent(Double.self, forKey: .uv) ?? 0
        self.vis = try response.decodeIfPresent(Double.self, forKey: .vis) ?? 0
        
        self.conditionText = try response.decodeIfPresent(String.self, forKey: .conditionText) ?? "NA"
        self.name = try response.decodeIfPresent(String.self, forKey: .name) ?? "NA"
        self.country = try response.decodeIfPresent(String.self, forKey: .country) ?? "NA"
    }
    
    struct Location : Codable {
        let name : String
        let country : String
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case country = "country"
        }
        
        init(from decoder: Decoder) throws {
            let response = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try response.decodeIfPresent(String.self, forKey: .name) ?? "NA"
            self.country = try response.decodeIfPresent(String.self, forKey: .country) ?? "NA"
        }
    }
    
//    struct Current : Codable {
//        let co
//    }
}

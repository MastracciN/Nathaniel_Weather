//
//  WeatherFetcher.swift
//  Nathaniel_Weather
//
//  Created by user929441 on 11/13/21.
//

import Foundation

class WeatherFetcher : ObservableObject{
    var apiURL = "https://api.weatherapi.com/v1/current.json?key=5426557749024a33855183308211311&q="
    
    @Published var weatherObj = Weather()
    
    init(lat: Double, long: Double){
        self.apiURL = "https://api.weatherapi.com/v1/current.json?key=5426557749024a33855183308211311&q=\(lat),\(long)"
        fetchDataFromAPI()
    }
    
    func fetchDataFromAPI(){
        guard let api = URL(string: apiURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: api){(data: Data?, response: URLResponse?, error: Error?) in
            
            if let err = error{
                print(#function, err)
            }else{
                //received data or response
                DispatchQueue.global().async {
                    do{
                        if let jsonData = data{
                            let decoder = JSONDecoder()
                            
                            let decodedWeatherObj = try decoder.decode(Weather.self, from: jsonData)
                            
                            DispatchQueue.main.async {
                                self.weatherObj = decodedWeatherObj
                            }
                            
                        }else{
                            print(#function, "No JSON data received")
                        }
                    }catch let error{
                        print(#function, error)
                    }
                }
            }
        }.resume()
    }
    
}

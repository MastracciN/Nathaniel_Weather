//
//  ContentView.swift
//  Nathaniel_Weather
//
//  Created by user929441 on 11/13/21.
//

import SwiftUI
import UIKit
import CoreLocation

struct ContentView: View {
    @EnvironmentObject var locationHelper: LocationHelper
    @EnvironmentObject var fetcher : WeatherFetcher

    var body: some View {
        VStack{
            if (self.locationHelper.currentLocation != nil){
//                AsyncImage(url: URL(string: fetcher.weatherObj.current.condition.icon))
                Text("\(fetcher.weatherObj.location.name), \(fetcher.weatherObj.location.country)")
                Text("Condition: \(fetcher.weatherObj.current.condition.text)")
                Text("Temp: \(fetcher.weatherObj.current.temp)")
                Text("Feels Like: \(fetcher.weatherObj.current.feelsLike)")
                Text("Wind KPH: \(fetcher.weatherObj.current.windKph)")
                Text("Wind Direction: \(fetcher.weatherObj.current.windDir)")
                Text("Humidity: \(fetcher.weatherObj.current.humidity)")
                Text("UV: \(fetcher.weatherObj.current.uv)")
                Text("Vis: \(fetcher.weatherObj.current.vis)")
                
            } else {
                Text("Wait a moment.. Make sure location permissions are on")
            }
            
        }.onAppear(perform: getWeather)//VStack
    }//body
    
    func getWeather(){
        if (self.locationHelper.currentLocation != nil){
            fetcher.fetchDataFromAPI(lat: self.locationHelper.currentLocation?.coordinate.latitude ?? 40, long: self.locationHelper.currentLocation?.coordinate.longitude ?? 40)
        } else {
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Nathaniel_Weather
//
//  Created by user929441 on 11/13/21.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @EnvironmentObject var locationHelper: LocationHelper

    var body: some View {
        VStack{
            if (self.locationHelper.currentLocation != nil){
                Text("\(self.locationHelper.currentLocation?.coordinate.latitude ?? 40.0000)")
                
            } else {
                Text("Wait a moment.. Make sure location permissions are on")
            }
            
        }.onAppear(perform: getWeather)//VStack
    }//body
    
    func getWeather(){
        
        if (self.locationHelper.currentLocation != nil){
            
        } else {
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

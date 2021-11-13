//
//  Nathaniel_WeatherApp.swift
//  Nathaniel_Weather
//
//  Created by user929441 on 11/13/21.
//

import SwiftUI

@main
struct Nathaniel_WeatherApp: App {
    let locationHelper = LocationHelper()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(locationHelper)
        }
    }
}

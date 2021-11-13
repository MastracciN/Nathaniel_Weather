//
//  ContentView.swift
//  Nathaniel_Weather
//
//  Created by user929441 on 11/13/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locationHelper: LocationHelper
    let hello = "hello"
    var body: some View {
        VStack{
            if (self.locationHelper.currentLocation != nil){
                Text(self.locationHelper.address)
            } else {
                Text("Wait a moment.. Make sure location permissions are on")
            }
            
        }//VStack
    }//body
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  WelcomeView.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 27/03/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationmanager: LocationManager
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .cornerRadius(50, corners: .allCorners)
                    .foregroundColor(.accentColor)
                    .shadow(color: .gray, radius: 4)
                    .padding()
                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .font(.system(size: 150))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .padding()
                    Text("Welcome to WeatherBee")
                        .bold()
                        .foregroundColor(.white)
                        .font(.headline)
                        .shadow(color: .black, radius: 1, x: 0, y: 1)
                }
                
            }
            .padding()
            Spacer()
            VStack {
                Text("This app will tell you the weather and air of your area, but we need your location for that!")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationmanager.requestLocation()
            }
            .cornerRadius(20)
            .padding()
            .symbolVariant(.none)
            .foregroundColor(.white)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

//
//  WeatherRow.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 29/03/22.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 10) {
            if #available(iOS 16.0, *) {
                Image(systemName: logo)
                    .font(.title2)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                    .cornerRadius(50)
                    .bold()
            } else {
                // Fallback on earlier versions
                Image(systemName: logo)
                    .font(.title2)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                    .cornerRadius(50)
            }

            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.caption.bold())
                Text(value)
                    .bold()
                    .font(.title3)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "28° C")
    }
}

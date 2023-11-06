//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Gonçalo Rocha on 08/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Curpertino, CA")
                
                MainWeatherView(mainImageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                mainTemperature: 24)
                .padding(.bottom, 40)

                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 18)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 31)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 17)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 19)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 10)
                }

            Spacer()
                
                Button {
                    isNight.toggle()
                }label: {
                    WeatherButtonView(title: "Change Day Time", 
                                      textColor: .blue,
                                      backgroundColor: .white)
                }
                
            Spacer()
                
            }
        }
    }
}


#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayOfWeek)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .medium, design: .default))
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)º")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
            }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue]),
                startPoint: .topLeading,
                endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var mainImageName: String
    var mainTemperature: Int
    
    var body: some View{
        VStack(spacing: 8) {
            Image(systemName: mainImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
        
            Text("\(mainTemperature)º")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

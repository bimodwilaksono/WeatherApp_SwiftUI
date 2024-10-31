//
//  ContentView.swift
//  WeatherApp
//
//  Created by Bimo Laksono on 12/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack{
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: .gray)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherView(imageName: "cloud.sun.fill", temperature: 32)
                Spacer()
                HStack (spacing: 20) {
                    WeatherDayView(day: "TUE", imageName: "cloud.sun.fill", temperature: 28)
                    WeatherDayView(day: "WED", imageName: "cloud.sun.fill", temperature: 28)
                    WeatherDayView(day: "THU", imageName: "cloud.sun.fill", temperature: 28)
                    WeatherDayView(day: "FRI", imageName: "cloud.sun.fill", temperature: 28)
                    WeatherDayView(day: "SAT", imageName: "cloud.sun.fill", temperature: 28)
                }
                Spacer()
                Button {
                    isNight.toggle()
                          } label: {
                        ButtonView(text: "Change Day Theme")
                    }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct WeatherDayView: View {
    var day: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView : View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 72, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

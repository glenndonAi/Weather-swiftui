//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Glenndon on 5/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {

        ZStack{
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 75)
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "Wed",
                                   imageName: "sun.max.fill",
                                   temperature: 10)
                    WeatherDayView(dayOfWeek: "Thu",
                                   imageName: "wind.snow",
                                   temperature: 20)
                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "sunset.fill",
                                   temperature: 30)
                    WeatherDayView(dayOfWeek: "Sat",
                                   imageName: "cloud.sun.fill",
                                   temperature: 50)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
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
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    var imageName: String
    var temperature: Int
    var body: some View{
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


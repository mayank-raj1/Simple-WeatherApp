//
//  ContentView.swift
//  Simple-WeatherApp
//
//  Created by Mayank Raj on 2024-01-08.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            Background(isNight: $isNight)
            VStack{
                CityHeader(city: "Cupertino", state: "CA")
                
                CureentWeatherHeader(img: "cloud.sun.fill", temp: 76)
                
                HStack(spacing: 20){
                    DayWeather(day: "TUE", temp: 70, img: "cloud.sun.fill")
                    DayWeather(day: "WED", temp: 65, img: "sun.haze.fill")
                    DayWeather(day: "THU", temp: 60, img: "sun.rain.fill")
                    DayWeather(day: "FIR", temp: 65, img: "sun.haze.fill")
                    DayWeather(day: "SAT", temp: 72, img: "cloud.sun.fill")
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(lable: "Change Day Time", backgroundColor: .white, textColor: .blue)
                }

                Spacer()
            }
            
        }
    }
}

//chalanges:
// 1. Use array or data model to display the weather
// 2. Use an API to get the data for the weather of the city
// 3. Use differnet tabs for different citys

#Preview {
    ContentView()
}

struct DayWeather: View {
    var day: String
    var temp: Int
    var img: String
    var body: some View {
        VStack(alignment: .center, spacing: 5){
            Text(day).font(.system(size: 25, weight: .medium)).foregroundColor(.white)
            Image(systemName: img).renderingMode(.original)
                .resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
            Text("\(temp)°").font(.system(size: 28, weight: .medium)).foregroundColor(.white)
        }
    }
}

struct Background: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors:
                                            [isNight ? Color.black : Color.blue,
                                             isNight ? Color.blue : Color.white]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct CityHeader: View {
    var city: String
    var state: String
    var body: some View {
        Text("\(city) \(state)").font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CureentWeatherHeader: View {
    var img: String
    var temp: Int
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: img).renderingMode(.original)
                .resizable().aspectRatio(contentMode: .fit).frame(width: 180, height: 180)
            Text("\(temp)°").font(.system(size: 70, weight: .medium)).foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    var lable: String
    var backgroundColor: Color
    var textColor: Color
    var body: some View {
        Text(lable).frame(width: 280, height: 50).background(backgroundColor).font(.system(size: 24, weight: .medium)).cornerRadius(10).foregroundColor(textColor)
    }
}

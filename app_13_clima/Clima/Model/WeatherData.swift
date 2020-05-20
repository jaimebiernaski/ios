//
//  WeatherData.swift
//  Clima
//
//  Created by Jaime Biernaski on 18/05/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let cod: Int
    let id: Int
    let timezone: Int
    let dt: Int
    let visibility: Int
    let base: String
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
    let coord: Coord
    let weather:[Weather]
    
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
}

struct Clouds: Codable {
    let all: Int
}

struct Sys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

//
//  WeatherManager.swift
//  Clima
//
//  Created by Jaime Biernaski on 18/05/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

/**
 By convention, in swift we create the protocol in the same class that will uses the protocol
 */
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=88291038680cbd19591087253e1488a9&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName.replacingOccurrences(of: " ", with:"%20"))"
        performRequest(with: urlString)
    }
    
    func fetchWeather ( latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let  urlString = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
     
    func performRequest(with urlString: String)   {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the URLSession a task
            //            let task = session.dataTask(with: url, completionHandler: handle(data:reponse:error:))
            let task = session.dataTask(with: url) { (data, reponse, error) in
                if error != nil {
                    print(error!)
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    //let dataString = String(data: safeData, encoding: .utf8)
                    if let weather = self.parseJson( safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // 4. Start the task
            task.resume()
            
            
        }
        
    }
    
    func parseJson(_ weatherData: Data) -> WeatherModel?{
        let decoder =  JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let temp =  decodedData.main.temp
            let id = decodedData.weather[0].id
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    /*
     //replace with closure on the spet 3 above
     func handle(data: Data?, reponse: URLResponse?, error: Error?){
     if error != nil {
     print(error!)
     return
     }
     
     if let safeData = data {
     let dataString = String(data: safeData, encoding: .utf8)
     print(dataString)
     }
     }
     */
}

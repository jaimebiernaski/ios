//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


protocol CoinManagerDelegate {
    func didGetExchangeRate(_ coinManager: CoinManager, exchangeRate: String, currency: String )
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "B8D3E6EF-295E-46F7-B47A-2236C1891507"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var currencySeleted = "AUD"
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)?apiKey=\(apiKey)"
        
        
        // Perform request
        
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the URLSession a task
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let exchangeRate = self.parseJson(safeData) {
                        
                        self.delegate?.didGetExchangeRate(self, exchangeRate: exchangeRate, currency: currency)
                    }
                }
                
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    
    
    func parseJson(_ exchangeData: Data) -> String? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: exchangeData)
            print ("decodedData",  decodedData)
            let exchangeRate = decodedData.rate
            
            return String(format: "%.2f",  exchangeRate)
            
        } catch {
            print (error)
            return nil
        }
    }
    
    
}

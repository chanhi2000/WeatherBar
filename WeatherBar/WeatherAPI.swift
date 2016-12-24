//
//  WeatherAPI.swift
//  WeatherBar
//
//  Created by LeeChan on 12/19/16.
//  Copyright © 2016 MarkiiimarK. All rights reserved.
//

import Foundation

struct Weather:CustomStringConvertible {
    
    var city:String
    var currentTemp:Float
    var conditions:String
    var icon:String
    
    var description:String {
        return "\(city): \(currentTemp)°F and \(conditions)"
    }
}

protocol WeatherAPIDelegate {
    func weatherDidUpdate(weather: Weather)
}

class WeatherAPI {
    let API_KEY = "d4a653e3a82730702cc02e7cdbbd213e"
    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    var delegate:WeatherAPIDelegate?
    
    init(delegate:WeatherAPIDelegate) {
        self.delegate = delegate
    }
    
    func fetchWeather(query: String, success: @escaping (Weather) -> Void) {
        let escapedQuery = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        let url = URL(string: "\(BASE_URL)?APPID=\(API_KEY)&units=imperial&q=\(escapedQuery!)")
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print("weather api: error: \(error)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200: // all good!
                    
                    if let weather = self.weatherFromJSONData(data: data!) {
                        success(weather)
                    }
//                    let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! String
//                    print(dataString)
                case 401: // unauthorized
                    print("weather api returned an 'unauthorized' response. Did you set your API key?")
                default:
                    print("weather api returned response: \(httpResponse.statusCode) \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
                }
            }
        }).resume()
        
    }
    
    func weatherFromJSONData(data: Data) -> Weather? {
        typealias JSONDict = [String:NSObject]
        let json:JSONDict
        
        do {
            json = try JSONSerialization.jsonObject(with: data, options: []) as! JSONDict
        } catch let error {
            print("JSON parsing failed:\(error)")
            return nil
        }
        
        var mainDict = json["main"] as! JSONDict
        var weatherList = json["weather"] as! [JSONDict]
        var weatherDict = weatherList[0]
        
        let weather = Weather(
            city: json["name"] as! String,
            currentTemp: mainDict["temp"] as! Float,
            conditions: weatherDict["main"] as! String,
            icon: weatherDict["icon"] as! String
        )
        print(weather)
        
        return weather
    }
}



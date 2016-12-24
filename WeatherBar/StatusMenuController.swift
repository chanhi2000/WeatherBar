//
//  StatusMenuController.swift
//  WeatherBar
//
//  Created by LeeChan on 12/19/16.
//  Copyright © 2016 MarkiiimarK. All rights reserved.
//

import Cocoa

let DEFAULT_CITY = "Seatle, WA"

class StatusMenuController: NSObject, WeatherAPIDelegate, PreferenceWindowDelegate {
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var weatherView: WeatherView!
    var preferencesWindow:PreferencesWindow!
    var weatherMenuItem:NSMenuItem!
    
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
    
    @IBAction func updateClicked(_ sender: NSMenuItem) {
        updateWeather()
    }
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    var weatherAPI:WeatherAPI!
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        weatherAPI = WeatherAPI(delegate: self)
        weatherMenuItem = statusMenu.item(withTitle: "Weather")
        weatherMenuItem.view = weatherView
        
        preferencesWindow = PreferencesWindow()
        preferencesWindow.delegate = self
        preferencesWindow.showWindow(nil)
        
        updateWeather()
    }
    
    func updateWeather() {
        let defaults = UserDefaults.standard
        let city = defaults.string(forKey: "city") ?? DEFAULT_CITY
        
        weatherAPI.fetchWeather(query: city) { weather in
            self.weatherView.update(weather: weather)
            print(weather.description)
        }
    }
    
    func weatherDidUpdate(weather: Weather) {
        print(weather.description)
    }
    
    func preferencesDidUpdate() {
        updateWeather()
    }
}

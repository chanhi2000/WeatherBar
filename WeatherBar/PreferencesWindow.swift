//
//  PreferencesWindow.swift
//  WeatherBar
//
//  Created by LeeChan on 12/19/16.
//  Copyright © 2016 MarkiiimarK. All rights reserved.
//

import Cocoa

protocol PreferenceWindowDelegate {
    func preferencesDidUpdate()
}

class PreferencesWindow: NSWindowController, NSWindowDelegate {
    
    @IBOutlet weak var cityTextField: NSTextField!
    var delegate:PreferenceWindowDelegate?
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
        
        let defaults = UserDefaults.standard
        let city = defaults.string(forKey: "city") ?? DEFAULT_CITY
        cityTextField.stringValue = city

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    override var windowNibName: String! {
        return "PreferencesWindow"
    }
    
    func windowWillClose(_ notification: Notification) {
        let defaults = UserDefaults.standard
        defaults.set(cityTextField.stringValue, forKey: "city")
        delegate?.preferencesDidUpdate()
    }
    
}

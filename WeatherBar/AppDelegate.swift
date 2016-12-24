//
//  AppDelegate.swift
//  WeatherBar
//
//  Created by LeeChan on 12/19/16.
//  Copyright © 2016 MarkiiimarK. All rights reserved.
//

// GOALS:
// 1. Add other weather info (high/low temp, humidity, sunrise/sunset, etc) to the Weather View
// 2. Change the status menu icon + title to reflect the current conditions
// 3. Add a timer to update the weather regularly (hint: NSRunLoop.mainRunLoop().addTimer(refreshTimer!, forMode: NSRunLoopCommonModes)).
// 4. Make it so clicking on the Weather View opens a browser with detailed weather information (hint: NSWorkspace.sharedWorkspace().openURL(url: NSURL)). Note that since we’re using a custom view, the menu item isn’t highlighted when you mouse over it, so you’ll probably want to do something to make it obvious that it is clickable.
// 5. Add some error handling. Right now if we get an unexpected response from the API, for example, bad things will happen.
// 6. Write some tests!
// 7. Add an app icon. This isn’t hard, but it can be a pain creating the various sizes that Apple wants. Fortunately, there are tools to make this easier.
// 8. Add a preference to launch the app on login. I’ve used the LaunchAtLoginController library in other apps. There’s also this blog post, if you want to try porting the code over to Swift.
// 9. Create an About window.
// 10. dd support for multiple cities. This will take some effort, especially if the number of cities is dynamic. I think you’ll have to put the Weather View in its own XIB, and load it manually (look at NSBundle.mainBundle().loadNibNamed(name, owner: owner, options: options)). The UI in Preferences will obviously need to be updated as well.

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


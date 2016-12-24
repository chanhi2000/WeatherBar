# WeatherBar

## What is it?
This is a simple and light macOS weather app, made by '[footle.org][00a]' for tutorial. 

> To be able to run the app properly, you need to sign up an account at [OpenWeatherMap][00b] and retrieve an unique API key. (See line 28 at `WeatherAPI.swift`)

## Features?
Here are the following features:
- Uses [OpenWeatherMap][00b]'s API to fetch weather information.
- Parses `.json` data into a swift object.
- Displays weather data at the MenuBar.

## Goals:
1. Add other weather info (high/low temp, humidity, sunrise/sunset, etc) to the Weather View
2. Change the status menu icon + title to reflect the current conditions
3. Add a timer to update the weather regularly (*hint*: `NSRunLoop.mainRunLoop().addTimer(refreshTimer!, forMode: NSRunLoopCommonModes))`.
4. Make it so clicking on the Weather View opens a browser with detailed weather information (*hint*:` NSWorkspace.sharedWorkspace().openURL(url: NSURL)`). Note that since we’re using a custom view, the menu item isn’t highlighted when you mouse over it, so you’ll probably want to do something to make it obvious that it is clickable.
5. Add some error handling. Right now if we get an unexpected response from the API, for example, bad things will happen.
6. [Write some tests!][01]
7. Add an app icon. This isn’t hard, but it can be a pain creating the [various sizes that Apple wants][02]. Fortunately, there are [tools to make this easier][03].
8. Add a preference to launch the app on login. I’ve used the [LaunchAtLoginController][04] library in other apps. There’s also [this blog][05] post, if you want to try porting the code over to Swift.
9. Create an About window.
10. dd support for multiple cities. This will take some effort, especially if the number of cities is dynamic. I think you’ll have to put the Weather View in its own XIB, and load it manually (look at `NSBundle.mainBundle().loadNibNamed(name, owner: owner, options: options)`). The UI in Preferences will obviously need to be updated as well.
11. Create a completely custom view when clicking on the app in the status bar. See the [Weather Live][06] app, for example. I haven’t tried this, but I suspect it is easier than you might think (depending on how fancy your view is, of course).



## Resources:
- __[The Swift Programming Languages][07]__: Apple’s documentation, also downloadable as a [free iBook][08]
- __[Apple's Swift Blog][09] and [Swift Resources][10]__: Straight from the source.
- __[NSHipster][11]__: Tons of great, in-depth articles on Objective-C, Swift, and Cocoa
- __[Ray Wenderlich's Tutorials][12]__
- __[Mike Ash's NSBlog][13]__: Great deep dives into Objective-C and Swift

[00a]: http://footle.org/WeatherBar/ 
[00b]: http://openweathermap.org/
[01]: https://developer.apple.com/library/mac/documentation/DeveloperTools/Conceptual/testing_with_xcode/Introduction/Introduction.html#//apple_ref/doc/uid/TP40014132-CH1-SW1
[02]: https://developer.apple.com/library/mac/documentation/GraphicsAnimation/Conceptual/HighResolutionOSX/Optimizing/Optimizing.html
[03]: https://itunes.apple.com/us/app/asset-catalog-creator-app/id809625456?mt=12
[04]: https://github.com/Mozketo/LaunchAtLoginController
[05]: http://bdunagan.com/2010/09/25/cocoa-tip-enabling-launch-on-startup/
[06]: https://itunes.apple.com/us/app/weather-live/id755717884?mt=12
[07]: https://developesur.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/
[08]: https://itunes.apple.com/us/book/the-swift-programming-language/id881256329?mt=11
[09]: https://developer.apple.com/swift/blog/
[10]: https://developer.apple.com/swift/resources/
[11]: http://nshipster.com/
[12]: http://www.raywenderlich.com/tutorials
[13]: https://mikeash.com/pyblog/





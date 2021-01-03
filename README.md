# Watchlitude
Amplitude analytics SDK for WatchOS.


## Installation:

### Swift Package Manager:

`dependencies: [
    .package(url: "https://github.com/mohammad-rahchamani/Watchlitude.git", .upToNextMajor(from: "0.0.1"))
]`

### CocoaPods:

`pod 'Watchlitude', '~> 0.0.1'`



## Usage:

### import Watchlitude:

add
`#import Watchlitude`
at the top of you `ExtensionDelegate.swift`


### set API key and device Id:

inside `applicationDidFinishLaunching` call `Watchlitude.shared.initializeApiKey` with your [amplitude](https://amplitude.com/) API key and set device Id by calling `Watchlitude.shared.setDeviceId`


### log events:

call `Watchlitude.shared.logEvent`

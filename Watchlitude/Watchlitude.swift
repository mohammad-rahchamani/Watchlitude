//
//  Watchlitude.swift
//  Watchlitude
//
//  Created by Mohammad Rahchamani on ۱۳۹۹/۱۰/۱۱.
//

import WatchKit

public final class Watchlitude {
    
    public static let shared: Watchlitude = Watchlitude()
    
    private var apiKey: String?
    
    private var userId: String?
    
    private var deviceId: String?
    
    private var sessionId: String = "-1"
    
    private var userProperties: [String: Any] = [:]
    
    private var sharedProperties: [String: Any] = [:]
    
    private init() {
        self.sharedProperties = self.getBaseParams()
        self.setSessionId(String(Int(Date().timeIntervalSince1970)))
    }
    
}

extension Watchlitude {
    
    public func initializeApiKey(_ key: String) {
        self.apiKey = key
    }
    
    public func setUserId(_ id: String) {
        self.userId = id
        self.setSharedProperties([AmplitudeKeys.userId.rawValue: id])
    }
    
    public func setDeviceId(_ id: String) {
        self.deviceId = id
        self.setSharedProperties([AmplitudeKeys.deviceId.rawValue: id])
    }
    
    public func initializeApiKey(_ key: String, userId: String) {
        self.initializeApiKey(key)
        self.setUserId(userId)
    }
    
    public func setUserProperties(_ props: [String: Any]) {
        self.userProperties.merge(props) {
            old, new in
            return old
        }
    }
}

extension Watchlitude {
    public func logEvent(_ event: String, properties: [String: Any] = [:]) {
        
        guard (self.sharedProperties.keys.contains(AmplitudeKeys.userId.rawValue) ||
                self.sharedProperties.keys.contains(AmplitudeKeys.deviceId.rawValue)),
                let apiKey = self.apiKey else {
            print("set device id or user id and api key.")
            return
        }
        
        var eventDictionary: [String: Any] = [
            AmplitudeKeys.apiKey.rawValue: apiKey
        ]
        
        var sharedDictionary = self.sharedProperties
        sharedDictionary.updateValue(self.userProperties,
                                     forKey: AmplitudeKeys.userProperties.rawValue)
        sharedDictionary.updateValue(properties,
                                     forKey: AmplitudeKeys.eventProperties.rawValue)
        sharedDictionary.updateValue(event,
                                     forKey: AmplitudeKeys.eventType.rawValue)
        sharedDictionary.updateValue(Int(Date().timeIntervalSince1970),
                                     forKey: AmplitudeKeys.time.rawValue)
        
        eventDictionary.updateValue([sharedDictionary],
                                    forKey: AmplitudeKeys.events.rawValue)
        
        Network.sendRequest(eventDictionary)
        
    }
}

extension Watchlitude {
    
    private func setSessionId(_ id: String) {
        self.sessionId = id
        self.setSharedProperties([AmplitudeKeys.sessionId.rawValue: id])
    }
    
    private func setSharedProperties(_ props: [String: Any]) {
        self.sharedProperties.merge(props) {
            old, new in
            return old
        }
    }
    
    private func getBaseParams() -> [String: Any] {
        var params: [String: Any] = [:]
        
        let device = WKInterfaceDevice.current()
        
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "unknown"
        
        params.updateValue(device.systemName,
                           forKey: AmplitudeKeys.platform.rawValue)
        params.updateValue(device.systemName,
                           forKey: AmplitudeKeys.osName.rawValue)
        params.updateValue(device.systemVersion,
                           forKey: AmplitudeKeys.osVersion.rawValue)
        params.updateValue("Apple",
                           forKey: AmplitudeKeys.deviceManufacturer.rawValue)
        params.updateValue(device.model,
                           forKey: AmplitudeKeys.deviceModel.rawValue)
        params.updateValue(version,
                           forKey: AmplitudeKeys.appVersion.rawValue)
        
        return params
    }
}

//
//  Network.swift
//  Watchlitude
//
//  Created by Mohammad Rahchamani on ۱۳۹۹/۱۰/۱۲.
//

import Foundation

class Network {
    
    private static let AMPLITUDE_URL = URL(string: "https://api.amplitude.com/2/httpapi")!
    
    static func sendRequest(_ data: [String: Any]) {
        
        guard let body = try? JSONSerialization.data(withJSONObject: data,
                                                     options: []) else {
            print("unable to serialize to json.")
            return
        }
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        // By default, the system will wait seven days to see if internet connectivity becomes available
        // but you can control that with the timeoutIntervalForResource
        // config.timeoutIntervalForResource = 60
        
        let session = URLSession(configuration: config)
        
        var request = URLRequest(url: AMPLITUDE_URL)
        request.httpMethod = "POST"
        
        request.setValue("application/json",
                         forHTTPHeaderField: "Content-type")
        
        
        request.httpBody = body
        
        let task = session.dataTask(with: request)
        
        task.resume()
        
    }
    
}

//
//  ContentView.swift
//  WatchlitudeExample WatchKit Extension
//
//  Created by Mohammad Rahchamani on ۱۳۹۹/۱۰/۱۲.
//

import SwiftUI
import Watchlitude

struct ContentView: View {
    var body: some View {
        Button(action: {
            Watchlitude.shared.logEvent("dummy_event",
                                        properties: [
                                            "foo": "bar"
                                        ])
        }, label: {
            Text("Log")
        })
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

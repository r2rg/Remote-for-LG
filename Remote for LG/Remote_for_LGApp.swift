//
//  Remote_for_LGApp.swift
//  Remote for LG
//
//  Created by Артур Галустян on 08.10.2025.
//

import SwiftUI

@main
struct Remote_for_LGApp: App {
    @State private var tvManager = TVManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(tvManager)
        }
    }
}

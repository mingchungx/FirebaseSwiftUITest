//
//  FirebaseTestApp.swift
//  FirebaseTest
//
//  Created by Mingchung Xia on 2023-05-02.
//

import SwiftUI
import Firebase

@main
struct FirebaseTestApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataManager)
        }
    }
}

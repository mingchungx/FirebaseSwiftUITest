//
//  ContentView.swift
//  FirebaseTest
//
//  Created by Mingchung Xia on 2023-05-02.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        WelcomeView()
            .environmentObject(dataManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataManager())
    }
}

//
//  NewObjectView.swift
//  FirebaseTest
//
//  Created by Mingchung Xia on 2023-05-02.
//

import SwiftUI

struct NewObjectView: View {
    @EnvironmentObject var dataManager: DataManager
    
    @State private var newObject = ""
    
    var body: some View {
        VStack {
            TextField("New Object", text: $newObject)
            
            Button {
                dataManager.addObject(field1: newObject)
            } label: {
                Text("Save")
            }
        }
        .padding()
    }
}

struct NewObjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewObjectView()
            .environmentObject(DataManager())
    }
}

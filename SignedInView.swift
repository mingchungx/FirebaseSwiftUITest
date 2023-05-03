//
//  SignedInView.swift
//  FirebaseTest
//
//  Created by Mingchung Xia on 2023-05-02.
//

import SwiftUI

struct SignedInView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            VStack {
                List(dataManager.objects, id: \.id) { object in
                    Text(object.field1)
                }
                
                NewObjectView()
            }
            .navigationTitle("Signed In View")
        }
    }
}

struct SignedInView_Previews: PreviewProvider {
    static var previews: some View {
        SignedInView()
            .environmentObject(DataManager())
    }
}

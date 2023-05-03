//
//  DataManager.swift
//  FirebaseTest
//
//  Created by Mingchung Xia on 2023-05-02.
//

import Foundation
import Firebase

// retrieves "ModelTest" from Firestore

class DataManager: ObservableObject {
    @Published var objects: [Model] = []
    
    init() {
        fetchObjects()
    }
    
    func fetchObjects() {
        objects.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("ModelTest") // this is the collection set in Firestore
        // each 'element' in a collection is called a 'document'
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    // decoding
                    let id = data["id"] as? String ?? ""
                    let field1 = data["field1"] as? String ?? ""
                    
                    let object = Model(id: id, field1: field1)
                    
                    self.objects.append(object)
                }
            }
        }
    }
    
    func addObject(field1: String) {
        let db = Firestore.firestore()
        let ref = db.collection("ModelTest").document(field1)
        ref.setData(["field1": field1, "id": 10]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

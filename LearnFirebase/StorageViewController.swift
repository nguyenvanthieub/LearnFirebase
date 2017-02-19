//
//  StorageViewController.swift
//  LearnFirebase
//
//  Created by Thieu Mao on 2/19/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit
import Firebase

class StorageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storage = FIRStorage.storage()
        let rootFolder = storage.reference(forURL: "gs://learnfirebase-9aebf.appspot.com")
        let audioFolder = rootFolder.child("audios")
        let audioFile = audioFolder.child("lethergo.mp3")
        let path = Bundle.main.path(forResource: "lethergo", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        do {
            let audioData = try Data(contentsOf: url)
            audioFile.put(audioData, metadata: nil) { (storeage: FIRStorageMetadata?, error: Error?) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print(audioData)
                }
            }
        } catch {
            print("Vao catch")
        }

    }

}

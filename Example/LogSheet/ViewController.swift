//
//  ViewController.swift
//  LogSheet
//
//  Created by b0ttleneck on 11/08/2018.
//  Copyright (c) 2018 b0ttleneck. All rights reserved.
//

import UIKit
import LogSheet

class ViewController: UIViewController {

    let logSheet = LogSheet.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        write()
        read()
       
    }
    
    func read() {
        if let data = logSheet.read(102) {
         print(data.description)
        }
    }
    
    func write() {
        let model = LogModel(identifer: 123, name: "3 New Errpr ", description: "3 This is a New Error", tags: [.buisnessError], type: .verbose, createTimestamp: Date(), updateTimestamp: Date())
        if logSheet.write(log: model) {
            print("Successfully Written")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


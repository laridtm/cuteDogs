//
//  ViewController.swift
//  cuteDogs
//
//  Created by Larissa Diniz on 19/08/20.
//  Copyright © 2020 Larissa Diniz. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {
    
    var networkProvider: Networkable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.networkProvider?.request(target: .random, success: { (response) in
            let randomDog = try? JSONDecoder().decode(RandomDog.self, from: response.data)
            print(randomDog)
            
        }, error: { (error) in          
            print(error)
        }, failure: { (error) in
            print(error)
        })
    }
}


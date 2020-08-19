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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkAdapter.request(target: .random, success: { (response) in
            print(String(data: response.data, encoding: .utf8))
        }, error: { (error) in
            print(error)
        }, failure: { (error) in
            print(error)
        })
    }
}


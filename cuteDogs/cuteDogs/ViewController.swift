//
//  ViewController.swift
//  cuteDogs
//
//  Created by Larissa Diniz on 19/08/20.
//  Copyright © 2020 Larissa Diniz. All rights reserved.
//

import UIKit
import Moya
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var dogImage: UIImageView!
    var networkProvider: Networkable?
    var randomDog: RandomDog?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.networkProvider?.request(target: .random, success: { (response) in
            self.randomDog = try? JSONDecoder().decode(RandomDog.self, from: response.data)
            
            if let message = self.randomDog?.message {
                let newMessage = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                guard let urlDogImage = URL(string: newMessage) else { return }
                self.dogImage.kf.indicatorType = .activity
                self.dogImage.kf.setImage(with: urlDogImage)
            }
        }, error: { (error) in          
            print(error)
        }, failure: { (error) in
            print(error)
        })
    }
}


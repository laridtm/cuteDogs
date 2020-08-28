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

class CuteDogsViewController: UIViewController {
    
    var presenter: CuteDogsPresentation?
    var randomDog: RandomDog?
    
    @IBOutlet weak var dogImage: UIImageView!
    @IBAction func newDog(_ sender: Any) {
        self.presenter?.loadDog()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.loadDog()
    }
}

extension CuteDogsViewController: CuteDogsViewProtocol {
    func show(randomDog: RandomDog) {
        self.randomDog = randomDog
        if let message = self.randomDog?.message {
            let newMessage = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            guard let urlDogImage = URL(string: newMessage) else { return }
            self.dogImage.kf.indicatorType = .activity
            self.dogImage.kf.setImage(with: urlDogImage)
        }
    }
}

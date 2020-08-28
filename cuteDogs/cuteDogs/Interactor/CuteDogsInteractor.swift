//
//  CuteDogsInteractor.swift
//  cuteDogs
//
//  Created by Larissa Diniz on 28/08/20.
//  Copyright © 2020 Larissa Diniz. All rights reserved.
//

import Foundation

class CuteDogsInteractor {

    var presenter: CuteDogsInteractorOutput?
    var networkProvider: Networkable?
    var randomDog: RandomDog?
}

extension CuteDogsInteractor: CuteDogsInteractorProtocol {
    func retrieveDog() {
        self.networkProvider?.request(target: .random, success: { (response) in
            self.randomDog = try? JSONDecoder().decode(RandomDog.self, from: response.data)
            guard let dog = self.randomDog else { return }
            self.presenter?.didReceive(randomDog: dog)
        }, error: { (error) in
            print(error)
        }, failure: { (error) in
            print(error)
        })
    }
}

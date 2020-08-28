//
//  CuteDogsContract.swift
//  cuteDogs
//
//  Created by Larissa Diniz on 28/08/20.
//  Copyright © 2020 Larissa Diniz. All rights reserved.
//

import Foundation

protocol CuteDogsInteractorOutput: class {
    func didReceive(randomDog: RandomDog)
}

protocol CuteDogsPresentation: class {
    func loadDog()
}

protocol CuteDogsInteractorProtocol: class {
    func retrieveDog()
}

protocol CuteDogsViewProtocol: class {
    func show(randomDog: RandomDog)
}

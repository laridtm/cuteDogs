//
//  cuteDogsPresenter.swift
//  cuteDogs
//
//  Created by Larissa Diniz on 28/08/20.
//  Copyright © 2020 Larissa Diniz. All rights reserved.
//

import Foundation

class CuteDogsPresenter {
    
    weak var view: CuteDogsViewProtocol?
    var interactor: CuteDogsInteractorProtocol?
    var router: CuteDogsRouter?
}

extension CuteDogsPresenter: CuteDogsPresentation {
    func loadDog() {
        self.interactor?.retrieveDog()
    }
}

extension CuteDogsPresenter: CuteDogsInteractorOutput {
    func didReceive(randomDog: RandomDog) {
        self.view?.show(randomDog: randomDog)
    }
}

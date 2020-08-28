//
//  CuteDogsRouter.swift
//  cuteDogs
//
//  Created by Larissa Diniz on 28/08/20.
//  Copyright © 2020 Larissa Diniz. All rights reserved.
//

import Foundation
import UIKit

class CuteDogsRouter {

    weak var view: CuteDogsViewController?

    static func setupModule() -> CuteDogsViewController {
        let provider = NetworkAdapter()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! CuteDogsViewController
        let presenter = CuteDogsPresenter()
        let router = CuteDogsRouter()
        let interactor = CuteDogsInteractor()
        
        interactor.networkProvider = provider
        viewController.presenter =  presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter

        return viewController
    }
}

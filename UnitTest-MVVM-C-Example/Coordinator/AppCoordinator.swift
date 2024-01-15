//
//  AppCoordinator.swift
//  UnitTest-MVVM-C-Example
//
//  Created by Serkan Kara on 14.01.2024.
//

import UIKit

protocol AppCoordinatoring {
    init(navigation: UINavigationController)
    func start()
}

class AppCoordinator: NSObject, AppCoordinatoring {
    
    var navigationController: UINavigationController
    
    required init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        let service = NetworkServiceImpl()
        let vm = NewsListVMImpl(service: service)
        let vc = NewsListVC()
        vc.inject(vm: vm)
        self.navigationController.viewControllers = [vc]
    }
}

//
//  NavigationManager.swift
//  filmes_populares
//
//  Created by Érika Moriya on 19/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import Foundation
import UIKit

class NavigationManager {
    
    static let shared = NavigationManager()
    
    let tabBarController: UITabBarController
    private (set) var viewControllers: [UIViewController] = []

    private init(){
        self.tabBarController = UITabBarController()
        self.viewControllers = [MoviesListViewController(), InfoViewController()]
        
        let icons = [UITabBarItem(title: "Lista", image: UIImage(named:"movie-list"), tag: 0), UITabBarItem(title: "Info", image: UIImage(named:"info"), tag: 1)]
        
        self.tabBarController.viewControllers = viewControllers.enumerated().map{ (index, item) in
            item.tabBarItem = icons[index]
            return UINavigationController(rootViewController: item)
        }
    }
    
}

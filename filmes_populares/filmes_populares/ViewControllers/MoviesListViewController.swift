//
//  MoviesListViewController.swift
//  filmes_populares
//
//  Created by Érika Moriya on 19/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import UIKit

class MoviesListViewController: ListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView?.delegate = self
        uiTableView?.dataSource = self
        print("#########   \(self.dataSource?.count)   #########")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MoviesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
}

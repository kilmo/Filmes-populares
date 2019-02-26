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
        self.title = "Filmes Populares"
        uiTableView?.delegate = self
        uiTableView?.dataSource = self
        
        MoviesCapsule.shared.downloadMovies(page: 1){
            self.dataSource = MoviesCapsule.shared.moviesList?.results
            self.uiTableView?.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newViewController = MovieDetailsViewController(nibName: "MovieDetailsViewController", bundle: nil)
        MoviesCapsule.shared.downloadCredits(){
            
            if let credits = MoviesCapsule.shared.credits?.crew {
                for staff in credits {
                    if staff.job == "Director" {
                        newViewController.director = staff
                    } else if staff.department == "Writing" && staff.job != "Screenplay" {
                        newViewController.author = staff
                    }
                }
            }
        }
        newViewController.posterImage = (tableView.cellForRow(at: indexPath) as? MovieTableViewCell)?.uiPoster?.image
        newViewController.movie = self.dataSource?[indexPath.row]
    NavigationManager.shared.tabBarController.viewControllers?.first?.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
